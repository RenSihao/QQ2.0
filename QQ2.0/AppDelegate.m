//
//  AppDelegate.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "AppDelegate.h"
#import "SHTabBarController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    /**
     将根控制器设置为主界面
     一个UITabBarController管理控制器(管理主界面)
     */
    SHTabBarController *SHTBC = [[SHTabBarController alloc] init];
    self.window.rootViewController = SHTBC;
    
    /**
     将根控制器设置为登录界面
     一个UINavigationController管理控制器(管理登录界面)
     */
    UIViewController *loginVC = [[LoginViewController alloc] init];
    UINavigationController *NC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    NC.viewControllers = @[loginVC];
    
     
     
    //设置window窗体
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    
    //选择程序启动的根控制器视图（二选一）
    //----------SHTBC正在重构中，有问题------------!!!!!!!!!!!!!!!!!!!!!!!!!
    self.window.rootViewController = SHTBC;
//    self.window.rootViewController = NC;

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
