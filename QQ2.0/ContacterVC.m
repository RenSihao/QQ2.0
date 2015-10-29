//
//  ContacterVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "ContacterVC.h"
#import "ContacterOneRowCell.h"

@interface ContacterVC ()

@property (nonatomic, strong) NSArray *messageFrameList;
@end

@implementation ContacterVC

#pragma mark - 视图生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //加载所有子控件
    [self addSubviews];
    
}
#pragma mark - 自定义方法
/**
 加载所有子控件
 */
- (void)addSubviews
{
    //加载导航栏中间视图
//    UIBarButtonItem *titleView = [[UIBarButtonItem alloc] initWithTitle:@"联系人" style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.titleView = titleView;
    
    self.navigationItem.title = @"联系人";
    
    
    //加载导航栏右边视图
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //搜索框设置placeholder
    self.searchPlaceHolder = @"搜索";
    
}
/**
 监听导航栏点击事件
 */
- (void)rightButtonItemClick
{
    NSLog(@"联系人视图导航栏右边item被点击");
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContacterOneRowCell *cell = [[ContacterOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}

@end
