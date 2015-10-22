//
//  TalkTableViewCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TalkFrameInfo;

@interface TalkTableViewCell : UITableViewCell

@property (nonatomic, strong) TalkFrameInfo *talkFrameInfo;
+ (TalkTableViewCell *)talkTableViewCellInit:(UITableView *)tableView;
@end
