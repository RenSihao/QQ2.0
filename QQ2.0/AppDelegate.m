//
//  AppDelegate.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "ContacterViewController.h"
#import "DynamicViewController.h"
#import "SettingViewController.h"
#import "TalkViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /*
    //主界面的四个UINavigationController
    UINavigationController *messageNC = [[UINavigationController alloc] initWithRootViewController:[[MessageViewController alloc] init]];
    messageNC.tabBarItem.title = @"消息";
    messageNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_recent_nor@2x" ofType:@"png"]];

    UINavigationController *contacterNC = [[UINavigationController alloc] initWithRootViewController:[[ContacterViewController alloc] init]];
    contacterNC.tabBarItem.title = @"联系人";
    contacterNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_buddy_nor@2x" ofType:@"png"]];
    
    UINavigationController *dynamicNC = [[UINavigationController alloc] initWithRootViewController:[[DynamicViewController alloc] init]];
    dynamicNC.tabBarItem.title = @"动态";
    dynamicNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_qworld_nor@2x" ofType:@"png"]];
    
    UINavigationController *settingNC = [[UINavigationController alloc] initWithRootViewController:[[SettingViewController alloc] init]];
    settingNC.tabBarItem.title = @"设置";
    settingNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_me_nor@2x" ofType:@"png"]];
    
    //一个UITabBarController管理控制器(管理主界面)
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = @[messageNC, contacterNC,dynamicNC, settingNC];
    */
     
    //一个UINavigationController管理控制器(管理登录界面)
    UIViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginVC];
    nc.viewControllers = @[loginVC];
    
     
     
    //设置window窗体
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = nc;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
