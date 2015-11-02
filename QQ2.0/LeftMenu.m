//
//  LeftMenu.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LeftMenu.h"
#import "LeftMenuHeadView.h"
#import "LeftMenuFootView.h"
#import "LeftCell.h"

@interface LeftMenu () <UITableViewDelegate, UITableViewDataSource, LeftMenuFootViewDelegate>

@property (nonatomic, weak) UITableView *listTableView;
@property (nonatomic, weak) LeftMenuHeadView *headView;
@property (nonatomic, weak) LeftMenuFootView *footView;
@end

@implementation LeftMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //添加头部视图
        LeftMenuHeadView *headView = [[LeftMenuHeadView alloc] init];
        _headView = headView;
        [self addSubview:_headView];
        
        //添加底部视图
        LeftMenuFootView *footView = [[LeftMenuFootView alloc] init];
        _footView = footView;
        _footView.delegate = self;
        [self addSubview:_footView];
        
        //添加tableview
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor grayColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView = tableView;
        [self addSubview:_listTableView];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W = self.frame.size.width;
    CGFloat footH = 40;
    _headView.frame = CGRectMake(0, -15, W, 125);
    _listTableView.frame = CGRectMake(0, 96, W, 445);
    _footView.frame = CGRectMake(0, self.frame.size.height - footH - 20, W, footH);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = _list[indexPath.row];
    
    //cell数量太少，可以不用cell复用机制
    LeftCell *cell = [[LeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = dict[@"title"];
    cell.imageView.image = [UIImage imageNamed:dict[@"imageName"]];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebar_rightarrow"]];
    if (indexPath.row == 2) {
        cell.lineIsHidden = NO;
    }
    return cell;
}


#pragma mark - UITableViewDelegate

-(void)LeftMenuFootViewSettingButtonIsClick
{
    if ([self.delegate respondsToSelector:@selector(leftMenuSettingButtonIsClick)]) {
        [self.delegate leftMenuSettingButtonIsClick];
    }
}





@end
