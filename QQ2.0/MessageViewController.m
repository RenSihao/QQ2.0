//
//  MessageViewController.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageView.h"
#import "TalkViewController.h"

@interface MessageViewController () <MessaeViewDelegate>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MessageView *messageView = [MessageView messageViewInit];
    messageView.delegate = self;
    self.view = messageView;
    
    //设置MessageViewController头部
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg_ios7_ip4@2x"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    //自定义头部左上角控件
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    iconView.image = [UIImage imageNamed:@"qqstar1@2x"];
    [leftView addSubview:iconView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    
    //自定义头部中间控件
    UISegmentedControl *midSC = [[UISegmentedControl alloc] initWithItems:@[@"消息",@"电话"]];
    midSC.selectedSegmentIndex = 0;
    midSC.layer.cornerRadius = 15;
    midSC.layer.masksToBounds = YES;
    midSC.frame = CGRectMake(0, 0, 70, 30);
    
//    midSC.layer.borderColor = [UIColor colorWithCGColor:];
    self.navigationItem.titleView = midSC;
    
    //自定义头部右上角控件
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage:[UIImage imageNamed:@"header_icon_list@2x"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"header_icon_list_pressed@2x"] forState:UIControlStateHighlighted];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ---
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - MessageViewDelegate
- (void)cellDidSelect:(UITableView *)tableView :(NSIndexPath *)indexPath
{
    TalkViewController *talkVC = [[TalkViewController alloc] init];
    [self.navigationController pushViewController:talkVC animated:YES];
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
