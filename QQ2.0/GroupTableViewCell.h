//
//  GroupTableViewCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupCellInfo;

@interface GroupTableViewCell : UITableViewCell

@property (nonatomic, strong) GroupCellInfo *groupCellInfo;
+ (instancetype)groupTableViewCellInit:(GroupCellInfo *)groupInfo withTableView:(UITableView *)tableView;
@end
