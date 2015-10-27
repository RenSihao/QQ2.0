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

@interface LeftMenu () <UITableViewDelegate, UITableViewDataSource>

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
        [self addSubview:_footView];
        
        //添加tableview
        UITableView *tableView = [[UITableView alloc] init];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView = tableView;
        [self addSubview:_listTableView];
        
    }
    return self;
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
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:dict[@""]];
    cell.textLabel.text = dict[@""];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    
    return cell;
}


#pragma mark - UITableViewDelegate







@end
