//
//  ContacterTableViewCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  MemberCellInfo;

@interface MemberTableViewCell : UITableViewCell

@property (nonatomic, strong) MemberCellInfo *memberCellInfo;
+ (instancetype)memberTableViewCellInit:(MemberCellInfo *)memberCellInfo withTableView:(UITableView *)tableView;
@end
