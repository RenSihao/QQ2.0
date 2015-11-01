//
//  FuntionCell.h
//  QQ2.0
//
//  Created by RenSihao on 15/11/1.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "SHSetting.h"

@interface FunctionCell : CommonTableViewCell

// 一般Type
@property (nonatomic, strong) SHSettingItem *item;
@property (nonatomic, assign) CGFloat titleFontSize;
@property (nonatomic, assign) CGFloat subTitleFontSize;
@property (nonatomic, assign) UIColor* subTitleFontColor;

// buttonType 用
@property (nonatomic, assign) UIColor *buttonTitleColor;
@property (nonatomic, assign) UIColor *buttonBackgroundGColor;

- (void) addTarget:(id)target action:(SEL)action;

@end
