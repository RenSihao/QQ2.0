//
//  DynamicVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicVC.h"
#import "DynamicOneRowCell.h"

@interface DynamicVC ()

@end

@implementation DynamicVC

#pragma mark - 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加所有子控件
    [self addSubviews];
    
}

#pragma mark - 自定义方法
/**
 加载所有子控件，包括自定义导航栏中间视图和右边视图
 */
- (void)addSubviews
{
   //加载导航栏中间视图
    self.navigationItem.title = @"动态";
    
    
    //加载导航栏右边视图
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonItemDidClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //设置搜索框的placeholder
    self.searchPlaceHolder = @"搜索电影／音乐／商品...";
    
    
    
}
/**
 监听导航栏点击事件
 */
- (void)rightButtonItemDidClick
{
    NSLog(@"动态视图导航栏right item被点击");
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DynamicOneRowCell *cell = [[DynamicOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}



#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30;
}















@end
