//
//  MessageTableViewCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageFrameInfo;

@interface MessageTableViewCell : UITableViewCell

@property (nonatomic, strong) MessageFrameInfo *messageFrameInfo;
+ (MessageTableViewCell *)messageTableViewCellInit:(UITableView *)tableView;
@end
