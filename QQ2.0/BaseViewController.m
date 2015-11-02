//
//  BaseViewController.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "BaseViewController.h"
#import "LeftMenu.h"
#import "SearchViewController.h"
#import "SettingVC.h"

#define LeftMenu_Width [UIScreen mainScreen].bounds.size.width * 0.75
#define LeftMenu_Height [UIScreen mainScreen].bounds.size.height - 64
#define TIMER 0.25

@interface BaseViewController () <LeftMenuDelegate>

@property (nonatomic, strong) LeftMenu *leftMenu;
@property (nonatomic, strong) UISearchController *searchVC;
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     对基本视图的共性加载
     */
    //添加tableview
    [self addBaseTableView];
    
    //添加导航栏左边视图
    [self addLeftButtonItem];
    
      
    /**
     以下都是对LeftMenu的加载
     */
    //添加左边菜单背景图片
    [self addBackgroundImage];
    
    //添加左边菜单
    [self addLeftMenu];
    
    
}

/**
 基本视图的tableview，包括搜索栏
 */
- (void)addBaseTableView
{
    UITableView *baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStylePlain];
    baseTableView.delegate = self;
    baseTableView.dataSource = self;
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    baseTableView.showsVerticalScrollIndicator = NO;
    
    
    
    //初始化一个search视图控制器，将搜索条以此为结果视图控制器（点击即跳转该视图控制器）
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    _searchVC = [[UISearchController alloc] initWithSearchResultsController:searchVC];
    //    _searchVC.delegate = self;
    _searchVC.hidesNavigationBarDuringPresentation = YES;
    _searchVC.searchBar.delegate = self;
    _searchVC.searchBar.tintColor = [UIColor orangeColor];
    _searchVC.searchBar.layer.borderWidth = 0.5f;
    _searchVC.searchBar.layer.borderColor = [UIColor redColor].CGColor;
    
    //将tableview的头部视图定义为searchBar
    [baseTableView setTableHeaderView:_searchVC.searchBar];
    
    
    //这个baseTableView就是除了NavigationBar和TabBar，中间的那部分
    [self.view addSubview:baseTableView];
}
/**
 添加导航栏左边的头像
 */
- (void)addLeftButtonItem
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"qqstar2"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = leftItem;
}
/**
 重写set搜索栏placeholder
 */
- (void)setSearchPlaceHolder:(NSString *)searchPlaceHolder
{
    _searchPlaceHolder = searchPlaceHolder;
}
/**
 添加左边菜单栏的头部背景
 */
- (void)addBackgroundImage
{
    //这个很重要，别问我为什么
    for(UIView *view in [UIApplication sharedApplication].keyWindow.subviews)
    {
        if([view isKindOfClass:[UIImageView class]])
        {
            [view removeFromSuperview];
        }
    }
    
    //初始化左边菜单栏的头部背景图片，添加到keywindow
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"sidebar_bg"];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 160);
    [[UIApplication sharedApplication].keyWindow insertSubview:imageView atIndex:0];
  
    
}
/**
 添加左边菜单栏的tableView
 */
- (void)addLeftMenu
{
    //拿到左边菜单栏的cell所有数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LeftMenuCell" ofType:@"plist"]];
    _leftMenu = [[LeftMenu alloc] initWithFrame:CGRectMake(0, HEADER_HEIGHT, LeftMenu_Width, LeftMenu_Height)];
    _leftMenu.delegate = self;
    _leftMenu.list = array;
    _leftMenu.hidden = YES;
    [[UIApplication sharedApplication].keyWindow insertSubview:_leftMenu atIndex:1];
    
}

-(void)coverClick:(UIButton *)cover
{
    [UIView animateWithDuration:TIMER *1.5 animations:^{
        CGAffineTransform scaleform = CGAffineTransformMakeScale(0.9, 0.9);
        CGAffineTransform anim = CGAffineTransformTranslate(scaleform, -80, 0);
        self.leftMenu.transform = anim;
        self.leftMenu.alpha = 0.1;
        self.tabBarController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.leftMenu.hidden = YES;
        [cover removeFromSuperview];
    }];
}

#pragma mark - LeftMenuDelegate
-(void)leftItemClick
{
    //self.navigationItem.leftBarButtonItem = nil;
    CGAffineTransform sacleForm = CGAffineTransformMakeScale(0.9, 0.9);//缩放
    CGAffineTransform tranSacleForm = CGAffineTransformTranslate(sacleForm, -80, 0); //缩放+移动
    self.leftMenu.transform = tranSacleForm;
    self.leftMenu.hidden = NO;
    self.leftMenu.alpha = 1.0;
    [UIView animateWithDuration:TIMER animations:^{
        self.leftMenu.transform = CGAffineTransformIdentity;
        //算出比例
        CGFloat navH = SCREEN_HEIGHT - 124;
        CGFloat scale = navH / SCREEN_HEIGHT;
        
        //左边菜单的距离
        CGFloat leftMagin = SCREEN_WIDTH * (1 - scale) *0.5;
        CGFloat translteX = (LeftMenu_Width - leftMagin)/scale;
        
        //设置移动缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        CGAffineTransform transScaleForm = CGAffineTransformTranslate(scaleForm, translteX, 0);
        self.tabBarController.view.transform = transScaleForm;
        
        //添加一个遮盖层
        UIButton *cover = [[UIButton alloc] initWithFrame:self.navigationController.view.bounds];
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationController.view addSubview:cover];
        
    }];
}
-(void)leftMenuSettingButtonIsClick
{
    [self coverClick:nil];
    
    SettingVC *setVC = [[SettingVC alloc] init];
    [self.navigationController pushViewController:setVC animated:YES];
    
    
}
//#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
//#pragma mark - UITableViewDelegate
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}



@end
