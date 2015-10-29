//
//  SHTabBarController.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHTabBarController.h"
#import "SHTabBar.h"
#import "SHNavigationController.h"

#import "MessageVC.h"
#import "ContacterVC.h"
#import "DynamicVC.h"

@interface SHTabBarController () <SHTabBarDelegate>

@property (nonatomic, strong) SHTabBar *costumTabBar;
@end

@implementation SHTabBarController

#pragma mark - 视图生命周期
- (void)viewDidLoad
{
    //LaunchImage显示2秒
    [NSThread sleepForTimeInterval:2];

    
    //初始化自定义tabbar
   // [self.tabBar addSubview:self.costumTabBar];
    
    //初始化所有子控制器
    [self initChildViewControllers];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    //移除系统自带的UITabBarButton
//    for(UIView *child in self.tabBar.subviews)
//    {
//        if([child isKindOfClass:[UIControl class]])
//        {
//            [child removeFromSuperview];
//        }
//    }
}

#pragma mark - 自定义方法

/**
 自定义tabbar懒加载
 */
- (SHTabBar *)costumTabBar
{
    if(!_costumTabBar)
    {
        _costumTabBar = [[SHTabBar alloc] init];
        _costumTabBar.frame = self.tabBar.bounds;
        _costumTabBar.backgroundColor = [UIColor whiteColor];
        _costumTabBar.delegate = self;
    }
    return _costumTabBar;
}

/**
 初始化所有子控制器
 */
- (void)initChildViewControllers
{
    //消息
    MessageVC *messageVC = [[MessageVC alloc] init];
    [self initChildViewController:messageVC title:@"消息" normalImageName:@"tab_recent_nor" selectImageName:@"tab_recent_press"];
    
    //联系人
    ContacterVC *contacterVC = [[ContacterVC alloc] init];
    [self initChildViewController:contacterVC title:@"联系人" normalImageName:@"tab_buddy_nor" selectImageName:@"tab_buddy_press"];
  

    //动态
    DynamicVC *dynamicVC = [[DynamicVC alloc] init];
    [self initChildViewController:dynamicVC title:@"动态" normalImageName:@"tab_qworld_nor" selectImageName:@"tab_qworld_press"];

    
    
    
    
   
    
    
    
}
/**
 一个子控制器的便利构造器
 */
- (void)initChildViewController:(UIViewController *)childVC title:(NSString *)title normalImageName:(NSString *)normalImage selectImageName:(NSString *)selectImage
{
    //设置控制器属性
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:normalImage];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    //添加一个导航控制器
    SHNavigationController *SHNC = [[SHNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:SHNC];
    
    //添加tabbar内部按钮
   // [self.costumTabBar addTabBarButtonItem:childVC.tabBarItem];
    
}

#pragma mark - SHTabBarDelegate
/**
 自定义tabbar监听按钮点击，切换子控制器
 @prama from 原来选中
 @prama to   最新选中
 */
- (void)tabBar:(SHTabBar *)tabBar didSlectedButtonFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}





@end

