//
//  SHNavigationController.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHNavigationController.h"

@interface SHNavigationController ()

@end

@implementation SHNavigationController

//重写此方法，一个类只会调用一次
+ (void)initialize
{
    //设置导航条主题
    [self initNavBarTheme];
    
    //设置导航条按钮主题
    [self initBarButtonItemTheme];
}

+ (void)initNavBarTheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置bar的颜色
    [navBar setBackgroundImage:[UIImage imageNamed:@"header_bg_ios7_ip4"] forBarMetrics:UIBarMetricsDefault];
    navBar.tintColor = [UIColor whiteColor];
    
    //设置状态栏
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置标题属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18.0f];
    [navBar setTitleTextAttributes:textAttrs];
    
    //设置返回按钮字体
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMax) forBarMetrics:UIBarMetricsDefault];
    
    
}
+ (void)initBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16.0f];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
   
    
}

//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    // 导航栏都是栈管理的，如果栈里面的内容大于0，说明push了，
//    if (self.viewControllers.count > 0) {
//        // 把tabbar隐藏
//        viewController.hidesBottomBarWhenPushed = YES;
//    }
//    
//    [super pushViewController:viewController animated:animated];
//}
@end
