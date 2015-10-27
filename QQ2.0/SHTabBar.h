//
//  SHTabBar.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHTabBar;

@protocol SHTabBarDelegate <NSObject>

@optional
- (void)tabBar:(SHTabBar *)tabBar didSlectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface SHTabBar : UIView

@property (nonatomic, weak) id<SHTabBarDelegate> delegate;
- (void)addTabBarButtonItem:(UITabBarItem *)item;
@end
