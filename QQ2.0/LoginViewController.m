//
//  LoginViewController.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/7.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "MessageViewController.h"
#import "ContacterViewController.h"
#import "DynamicViewController.h"
#import "SettingViewController.h"
#import "TalkViewController.h"

@interface LoginViewController () <LoginViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    LoginView *loginView = [LoginView loginViewInit];
    loginView.delegate = self;
    self.view = loginView;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LoginViewDelegate
- (void)loginBtnDidClick:(LoginView *)loginView
{
    //主界面的四个UINavigationController
    UINavigationController *messageNC = [[UINavigationController alloc] initWithRootViewController:[[MessageViewController alloc] init]];
    messageNC.tabBarItem.title = @"消息";
    messageNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_recent_nor@3x" ofType:@"png"]];
    
    UINavigationController *contacterNC = [[UINavigationController alloc] initWithRootViewController:[[ContacterViewController alloc] init]];
    contacterNC.tabBarItem.title = @"联系人";
    contacterNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_buddy_nor@3x" ofType:@"png"]];
    
    UINavigationController *dynamicNC = [[UINavigationController alloc] initWithRootViewController:[[DynamicViewController alloc] init]];
    dynamicNC.tabBarItem.title = @"动态";
    dynamicNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_qworld_nor@3x" ofType:@"png"]];
    
    UINavigationController *settingNC = [[UINavigationController alloc] initWithRootViewController:[[SettingViewController alloc] init]];
    settingNC.tabBarItem.title = @"设置";
    settingNC.tabBarItem.image = [UIImage imageNamed:[[NSBundle mainBundle] pathForResource:@"tab_me_nor@2x" ofType:@"png"]];
    
    //一个UITabBarController管理控制器(管理主界面)
    UITabBarController *tbc = [[UITabBarController alloc] init];
    tbc.viewControllers = @[messageNC, contacterNC,dynamicNC, settingNC];
    
    //跳转至主界面
    [self.navigationController pushViewController:tbc animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
