//
//  DynamicView.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicView.h"
#import "Commond.h"
#import "DynamicInfo.h"
//#import "DynamicCellInfo.h"

@interface DynamicView () <UITableViewDataSource, UITableViewDelegate,UITabBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *dynamicGroupInfoPlist;
@end

@implementation DynamicView
#pragma mark - 接口部分
+ (instancetype)dynamicViewInit
{
    DynamicView *dynamicView = [[DynamicView alloc] init];
    return dynamicView;
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
        _tableView.tableHeaderView= self.searchBar;
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        
    }
    return _tableView;
}
- (UISearchBar *)searchBar
{
    if(!_searchBar)
    {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
        _searchBar.placeholder = @"搜索电影/音乐/商品...";
    }
    return _searchBar;
}
- (NSArray *)dynamicGroupInfoPlist
{
    if(!_dynamicGroupInfoPlist)
    {
        _dynamicGroupInfoPlist = [DynamicInfo dynamicInfoPlist];
    }
    return _dynamicGroupInfoPlist;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dynamicGroupInfoPlist.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dynamicGroupInfoPlist[section] groupInfoArray].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"dynamic";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    cell.imageView.image = [UIImage imageNamed:[[self.dynamicGroupInfoPlist[indexPath.section] groupInfoArray][indexPath.row] icon]];
    cell.textLabel.text = [[self.dynamicGroupInfoPlist[indexPath.section] groupInfoArray][indexPath.row] title];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
