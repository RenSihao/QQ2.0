//
//  DynamicVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicVC.h"
#import "DynamicOneRowCell.h"
#import "FunctionCell.h"
#import "SHSetting.h"
#import "SHUIHelper.h"

@interface DynamicVC ()

@property (nonatomic, strong) NSMutableArray *datas; //除了第一组的横着的那一行cell之外的cell，所有数据
@end

@implementation DynamicVC

#pragma mark - 生命周期
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加所有子控件
    [self addSubviews];
    
    //加载数据源
    [self initData];
    
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
    
    //
   
    
}
- (void)initData
{
    _datas = [SHUIHelper getDynamicItems];
    [self.tableView reloadData];
}
/**
 监听导航栏点击事件
 */
- (void)rightButtonItemDidClick
{
    NSLog(@"动态视图导航栏right item被点击");
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
        DynamicOneRowCell *cell = [[DynamicOneRowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        return cell;
    }
    else
    {
        SHSettingGroup *group = [_datas objectAtIndex:indexPath.section - 1];
        SHSettingItem *item = [group itemAtIndex:indexPath.row];
        FunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(!cell)
        {
            cell = [[FunctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.item = item;
        [cell setTitleFontSize:13];
        [cell setSubTitleFontSize:13];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        
        cell.leftFreeSpace = 50;
        NSLog(@"%lf", cell.leftFreeSpace);
        //如果这个cell是一组的第一个，则设置头部线，否则没有头部线
        indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
        //如果这个cell是一组的最后一个，则设置底部线，否则没有底部线
        indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
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
        return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 0;
    }
    else
        return 20;
    
}
















@end
