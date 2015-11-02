//
//  DynamicOneRowCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DynamicOneRowCell;

@protocol DynamicOneRowCellDelegate <NSObject>

- (void)oneRowCellDidClick:(DynamicOneRowCell *)oneRowCell button:(UIButton *)sender;

@end

@interface DynamicOneRowCell : UITableViewCell

@property (nonatomic, weak) id<DynamicOneRowCellDelegate> delegate;
@end
