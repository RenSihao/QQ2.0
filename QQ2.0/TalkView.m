//
//  TalkView.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "TalkView.h"
#import "Commond.h"
#import "TalkFrameInfo.h"
#import "TalkInfo.h"
#import "TalkTableViewCell.h"
#define Footer_Height 45

@interface TalkView () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UINavigationBar *headerBar;
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) UIToolbar       *footerBar;
@property (nonatomic, strong) NSArray         *talkFramePlist;
@end

@implementation TalkView

#pragma mark - 接口部分
+ (TalkView *)talkViewInit
{
    TalkView *talkView = [[self alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    return talkView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self  = [super initWithFrame:frame])
    {
        [self addSubview:self.headerBar];
        [self addSubview:self.tableView];
        [self addSubview:self.footerBar];
        NSNotificationCenter *notifiCenter = [NSNotificationCenter defaultCenter];
        [notifiCenter addObserver:self selector:@selector(UIKeyboardWillChangeFrameAction:) name:@"UIKeyboardWillChangeFrameNotification" object:nil];
        
    }
    return self;
}
#pragma mark - 懒加载
- (UINavigationBar *)headerBar
{
    if(!_headerBar)
    {
        _headerBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, HEADER_HEIGHT)];
        
        
        
    }
    return _headerBar;
}
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-Footer_Height-HEADER_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0f];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.allowsSelection = NO;
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        
    }
    return _tableView;
}
- (UIToolbar *)footerBar
{
    if(!_footerBar)
    {
        _footerBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame), [[UIScreen mainScreen] bounds].size.width, Footer_Height)];
        [_footerBar setBackgroundColor:[UIColor grayColor]];
        CGFloat margin = 5;
        UIButton *voiceBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin, margin, 35, 35)];
        [voiceBtn setImage:[UIImage imageNamed:@"chat_bottom_voice_nor@3x"] forState:UIControlStateNormal];
        [voiceBtn setImage:[UIImage imageNamed:@"chat_bottom_voice_press@3x"] forState:UIControlStateHighlighted];
        UITextField *chatTF = [[UITextField alloc] initWithFrame:CGRectMake(margin+CGRectGetMaxX(voiceBtn.frame), margin, 245, 35)];
        [chatTF setBorderStyle:UITextBorderStyleRoundedRect];
        [chatTF setKeyboardType:UIKeyboardTypeDefault];
        [chatTF setBackground:[UIImage imageNamed:@"chat_bottom_textfield@2x"]];
        UIButton *expressionBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin+CGRectGetMaxX(chatTF.frame), margin, 35, 35)];
        [expressionBtn setImage:[UIImage imageNamed:@"chat_bottom_smile_nor@3x"] forState:UIControlStateNormal];
        [expressionBtn setImage:[UIImage imageNamed:@"chat_bottom_smile_press@3x"] forState:UIControlStateHighlighted];
        UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(margin+CGRectGetMaxX(expressionBtn.frame), margin, 35, 35)];
        [addBtn setImage:[UIImage imageNamed:@"chat_bottom_up_nor@3x"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"chat_bottom_up_press@3x"] forState:UIControlStateHighlighted];
        [_footerBar addSubview:voiceBtn];
        [_footerBar addSubview:chatTF];
        [_footerBar addSubview:expressionBtn];
        [_footerBar addSubview:addBtn];
    }
    return _footerBar;
}
- (NSArray *)talkFramePlist
{
    if(!_talkFramePlist)
    {
        NSArray *talkInfoPlist = [TalkInfo talkInfoPlist];
        NSMutableArray *talkFrameArray  = [NSMutableArray array];
        for(TalkInfo *talkInfo in talkInfoPlist)
        {
            TalkFrameInfo *talkFrameInfo = [[TalkFrameInfo alloc] init];
            talkFrameInfo.talkInfo = talkInfo;
            [talkFrameArray  addObject:talkFrameInfo];
        }
        _talkFramePlist = talkFrameArray;
    }
    return _talkFramePlist;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.talkFramePlist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkTableViewCell *cell = [TalkTableViewCell talkTableViewCellInit:tableView];
    cell.talkFrameInfo = self.talkFramePlist[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.talkFramePlist[indexPath.row] rowHeight];
}


#pragma mark - 响应
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endEditing:YES];
    [self resignFirstResponder];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
    [self resignFirstResponder];
}

-(void)UIKeyboardWillChangeFrameAction:(NSNotification*)notifi
{
    NSLog(@"%@", notifi);
    
    CGRect frame = [[notifi.userInfo valueForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    CGFloat offset = frame.origin.y - [UIScreen mainScreen].bounds.size.height;
    self.footerBar.transform = CGAffineTransformMakeTranslation(0, offset);
    self.tableView.transform = CGAffineTransformMakeTranslation(0, offset);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
