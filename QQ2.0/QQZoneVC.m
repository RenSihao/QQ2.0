//
//  QQZoneVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/11/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "QQZoneVC.h"
#import "UIImage+UIColor.h"
#import "QQZoneHeaderView.h"

#define HeaderViewHeight 250

@interface QQZoneVC () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) QQZoneHeaderView *headerView;
@end

@implementation QQZoneVC

#pragma mark - 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    [self addSubviews];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 1) colorWithAlphaComponent:1]] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 自定义方法
- (void)addSubviews
{
    //设置导航栏
    self.title = @"好友动态";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 0) colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[QQColorAlpha(24, 180, 237, 0) colorWithAlphaComponent:0]]];
    
    
    //添加头部视图
    [self.view addSubview:self.headerView];
    
    //
    UITableView *tableView = [[UITableView alloc] init];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.contentInset = UIEdgeInsetsMake(HeaderViewHeight, 0, 0, 0);
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+64);
    
    
    [self.view addSubview:tableView];
    
}

#pragma mark - lazyload
- (QQZoneHeaderView *)headerView
{
    if(!_headerView)
    {
        _headerView = [[QQZoneHeaderView alloc] initWithFrame:CGRectMake(0, HeaderViewHeight, SCREEN_WIDTH, -HeaderViewHeight)];
    }
    return _headerView;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"QQZoneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    cell.textLabel.text = @"小明";
    cell.detailTextLabel.text = @"今天10:58";
    cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
    
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
























@end
