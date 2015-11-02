//
//  LeftMenuFootView.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LeftMenuFootView;
@protocol LeftMenuFootViewDelegate <NSObject>

-(void)LeftMenuFootViewSettingButtonIsClick;

@end

@interface LeftMenuFootView : UIView

@property (nonatomic, weak) id<LeftMenuFootViewDelegate> delegate;
@end
