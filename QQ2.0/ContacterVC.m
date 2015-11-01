//
//  ContacterVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "ContacterVC.h"
#import "ContacterOneRowCell.h"
#import "SHUIHelper.h"
#import "SHSetting.h"
#import "FunctionCell.h"

@interface ContacterVC ()

@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation ContacterVC

#pragma mark - 视图生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //加载所有子控件
    [self addSubviews];
    
    //加载数据
    [self initDatas];
    
    
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
 加载数据源
 */
- (void)initDatas
{
    _datas = [SHUIHelper getContactItems];
    [self.tableView reloadData];
}
/**
 监听导航栏点击事件
 */
- (void)rightButtonItemClick
{
    NSLog(@"联系人视图导航栏右边item被点击");
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _datas.count + 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
    }
    else
    {
        SHSettingGroup *group = [_datas objectAtIndex:section - 1];
        return group.itemsCount;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        ContacterOneRowCell *cell = [[ContacterOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        return cell;
    }
    else
    {
        SHSettingGroup *group = [_datas objectAtIndex:indexPath.section - 1];
        SHSettingItem *item = [group itemAtIndex:indexPath.row];
        FunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactGroup"];
        if(!cell)
        {
            cell = [[FunctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactGroup"];
        }
        cell.item = item;
        [cell setTitleFontSize:14];
        [cell setSubTitleFontSize:10];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        
        cell.leftFreeSpace = 0;
        [cell setBackgroundColor:[UIColor clearColor]];
        //观察QQ联系人，发现每一个都有头部线
        [cell setTopLineStyle:CellLineStyleFill];
        [cell setBottomLineStyle:CellLineStyleNone];
        
        return cell;
    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 80;
    }
    else
    {
        return 50;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 0;
    }
    else
    {
        return 25;
    }
}

@end
