//
//  MessageVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageVC.h"
#import "MessageTitleView.h"

#import "MessageTableViewCell.h"
#import "MessageFrameInfo.h"
#import "MessageInfo.h"

@interface MessageVC ()

@property (nonatomic, strong) NSArray *messageFrameList;
@end

@implementation MessageVC

#pragma mark - 视图生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加所有子控件
    [self addSubviews];
    
}
#pragma mark - 自定义方法
/**
 添加所有子控件，包括导航栏的中间视图和右边视图
 */
- (void)addSubviews
{
    //添加导航栏右边视图
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"header_icon_list"] style:UIBarButtonItemStyleDone target:self action:@selector(rightItemDidClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //添加导航栏中间视图
    MessageTitleView *titleView = [[MessageTitleView alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    self.navigationItem.titleView = titleView;
    
    //给搜索框内设置palceholder
    self.searchPlaceHolder = @"搜索";
    
 
    
}
/**
 监听导航栏点击
 */
- (void)rightItemDidClick
{
    NSLog(@"消息视图导航栏right item 被点击");
    
}
/**
 消息列表的所有cell数据懒加载
 */
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





















@end
