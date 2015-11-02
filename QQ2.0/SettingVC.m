//
//  SettingVC.m
//  QQ2.0
//
//  Created by RenSihao on 15/11/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SettingVC.h"
#import "SHUIHelper.h"
#import "FunctionCell.h"

@interface SettingVC ()
@property (nonatomic ,strong) NSMutableArray *datas;
@end

@implementation SettingVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addSubViews];
}

-(void)addSubViews
{
    self.title = @"设置";
    _datas = [SHUIHelper getSettingItems];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.tableView.tableHeaderView = headerView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _datas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SHSettingGroup *group = _datas[section];
    return group.itemsCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHSettingGroup *group = _datas[indexPath.section];
    SHSettingItem *item = [group itemAtIndex:indexPath.row];
    static NSString *ID = @"setting";
    FunctionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[FunctionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    [cell setItem:item];
    [cell setTitleFontSize:13];
    [cell setSubTitleFontSize:13];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    indexPath.row == 0 ? [cell setTopLineStyle:CellLineStyleFill] :[cell setTopLineStyle:CellLineStyleNone];
    indexPath.row == group.itemsCount - 1 ? [cell setBottomLineStyle:CellLineStyleFill] : [cell setBottomLineStyle:CellLineStyleDefault];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else {
        return 20;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



@end
