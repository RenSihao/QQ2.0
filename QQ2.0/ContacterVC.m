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

@end

@implementation ContacterVC



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
    return 75;
}


@end
