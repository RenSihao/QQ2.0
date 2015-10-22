//
//  DynamicViewController.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicView.h"

@interface DynamicViewController ()

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    DynamicView *dynamicView = [DynamicView dynamicViewInit];
    self.view = dynamicView;
    
    //设置头部
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg_ios7_ip4@2x"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    //自定义头部左上角控件
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    iconView.image = [UIImage imageNamed:@"qqstar1@2x"];
    [leftView addSubview:iconView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    //自定义头部中间控件
    UILabel *midLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    midLab.text = @"动态";
    midLab.font = [UIFont systemFontOfSize:20.0f];
    midLab.textColor = [UIColor whiteColor];
    midLab.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = midLab;
    
    //自定义头部右上角控件
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
