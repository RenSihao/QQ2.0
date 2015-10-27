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

#define LeftMenu_Width [UIScreen mainScreen].bounds.size.width * 0.75
#define LeftMenu_Height [UIScreen mainScreen].bounds.size.height - 64

@interface BaseViewController ()

@property (nonatomic, strong) LeftMenu *leftMenu;
@property (nonatomic, strong) UISearchController *searchVC;
@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加背景图片
    [self addBackgroundImage];
    
    //添加tableview
    [self addBaseTableView];
    
    //添加左边菜单
    [self addLeftMenu];
    
}

- (void)addBackgroundImage
{
    //这个很重要，没有这个你试试
    for(UIView *view in [UIApplication sharedApplication].keyWindow.subviews)
    {
        if([view isKindOfClass:[UIImageView class]])
        {
            [view removeFromSuperview];
        }
    }
    
    //初始化头部背景图片，添加到keywindow
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@""];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 160);
    [[UIApplication sharedApplication].keyWindow insertSubview:imageView atIndex:0];
  
    
}
- (void)addLeftMenu
{
    //加载出左边菜单cell的数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"" ofType:@"plist"]];
    _leftMenu = [[LeftMenu alloc] initWithFrame:CGRectMake(0, HEADER_HEIGHT, LeftMenu_Width, LeftMenu_Height)];
    _leftMenu.list = array;
    _leftMenu.hidden = YES;
    [[UIApplication sharedApplication].keyWindow insertSubview:_leftMenu atIndex:1];
    
}

- (void)addBaseTableView
{
    UITableView *baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    baseTableView.delegate = self;
    baseTableView.dataSource = self;
    baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    baseTableView.showsVerticalScrollIndicator = NO;
    
    
    _tableView = baseTableView;
    
    //初始化一个search视图控制器，将搜索条以此为结果视图控制器（点击即跳转该视图控制器）
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    _searchVC = [[UISearchController alloc] initWithSearchResultsController:searchVC];
//    _searchVC.delegate = self;
    _searchVC.hidesNavigationBarDuringPresentation = YES;
    _searchVC.searchBar.delegate = self;
    _searchVC.searchBar.tintColor = [UIColor orangeColor];
    _searchVC.searchBar.layer.borderWidth = 0.5f;
    _searchVC.searchBar.layer.borderColor = [UIColor redColor].CGColor;
    
    //给tableview的头部视图定义为searchBar
    [baseTableView setTableHeaderView:_searchVC.searchBar];
    
    
    [self.view addSubview:baseTableView];
}

- (void)setSearchPlaceHolder:(NSString *)searchPlaceHolder
{
    _searchPlaceHolder = searchPlaceHolder;
}










@end
