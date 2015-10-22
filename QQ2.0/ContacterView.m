//
//  ContacterView.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "ContacterView.h"
#import "Commond.h"
#import "ContactInfo.h"
#import "GroupTableViewCell.h"


@interface ContacterView () <UITableViewDataSource, UITableViewDelegate>

//子控件部分
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
//数据部分
@property (nonatomic, strong) NSArray *contactInfoPlist;
@end

@implementation ContacterView

#pragma mark - 接口部分
+ (instancetype)contacterViewInit
{
    ContacterView *contacterView = [[ContacterView alloc] init];
    return contacterView;
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
//子控件部分
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
        _tableView.tableHeaderView = self.searchBar;
        _tableView.delegate   = self;
        _tableView.dataSource = self;
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
//数据部分
- (NSArray *)contactInfoPlist
{
    if(!_contactInfoPlist)
    {
        _contactInfoPlist = [ContactInfo contactInfoPlist];
    }
    return _contactInfoPlist;
}
#pragma mark - UITableViewDataSource
//返回组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.contactInfoPlist.count;
}
//返回每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contactInfoPlist[section] sectionArray].count;
}
//返回每行的cell视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupTableViewCell *groupCell = [GroupTableViewCell groupTableViewCellInit:[self.contactInfoPlist[indexPath.section] sectionArray][indexPath.row] withTableView:tableView];
    return groupCell;
}

#pragma mark - UITableViewDelegate
//返回每行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
//返回每组的头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
