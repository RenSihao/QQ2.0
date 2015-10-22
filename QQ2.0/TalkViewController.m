//
//  TalkViewController.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/5.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "TalkViewController.h"
#import "TalkView.h"

@interface TalkViewController () <UITableViewDelegate>

@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBarController.tabBar.hidden = YES;
    self.view = [TalkView talkViewInit];
    //处理掉push该页面时右上角奇怪的黑影
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 跳转
- (void)backDidSelect
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
