//
//  MessageView.h
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageView;
@protocol MessaeViewDelegate <NSObject>

@optional
- (void)cellDidSelect:(UITableView *)tableView :(NSIndexPath *)indexPath;
@end

@interface MessageView : UIView

@property (nonatomic, weak) id<MessaeViewDelegate> delegate;
+ (instancetype)messageViewInit;
@end
