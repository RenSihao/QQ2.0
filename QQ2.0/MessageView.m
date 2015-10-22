//
//  MessageView.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageView.h"
#import "Commond.h"
#import "MessageInfo.h"
#import "MessageFrameInfo.h"
#import "MessageTableViewCell.h"
#import "TalkViewController.h"

@interface MessageView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *messageFrameList;
@end

@implementation MessageView

#pragma mark - 接口部分
+ (instancetype)messageViewInit
{
    MessageView *messageView = [[MessageView alloc] init];
    return messageView;
}
- (instancetype)init
{
    if(self = [super init])
    {
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:({
            CGRect frame = CGRectMake(0, 0,
                                      [[UIScreen mainScreen] bounds].size.width,
                                      [[UIScreen mainScreen] bounds].size.height-FOOTER_HEIGHT);
            frame;
        })
                                                  style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.tableHeaderView = self.searchBar;
    }
    return _tableView;
}
- (UISearchBar *)searchBar
{
    if(!_searchBar)
    {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
        _searchBar.placeholder = @"搜索";
    }
    return _searchBar;
}
- (NSArray *)messageFrameList
{
    if(!_messageFrameList)
    {
        NSArray *messageInfoArray = [MessageInfo messageInfoPlist];
        NSMutableArray *messageFrameArray = [NSMutableArray array];
        for(MessageInfo *messageInfo in messageInfoArray)
        {
            MessageFrameInfo *messageFrameInfo = [[MessageFrameInfo alloc] init];
            messageFrameInfo.messageInfo = messageInfo;
            [messageFrameArray addObject:messageFrameInfo];
        }
        _messageFrameList = messageFrameArray;
    }
    return _messageFrameList;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageFrameList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageTableViewCell *cell = [MessageTableViewCell messageTableViewCellInit:tableView];
    cell.messageFrameInfo = self.messageFrameList[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(cellDidSelect::)])
    {
        [self.delegate cellDidSelect:tableView :indexPath];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
