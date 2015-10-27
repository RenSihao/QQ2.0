//
//  SHTabBar.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHTabBar.h"
#import "SHTabBarButton.h"

@interface SHTabBar ()

@property (nonatomic, strong) NSMutableArray *tabBarButtons; //存放自定义按钮的数组
@property (nonatomic, weak) SHTabBarButton *selectedButton; //记录当前处于选中状态的按钮
@end

@implementation SHTabBar
/**
 一个添加自定义按钮的对外开放的实例方法
 */
- (void)addTabBarButtonItem:(UITabBarItem *)item
{
    //创建按钮，并添加到数组中
    SHTabBarButton *button = [[SHTabBarButton alloc] init];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    //设置按钮数据
    button.item = item;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //默认选中第0个
    if(self.tabBarButtons.count == 1)
    {
        [self buttonDidClick:button];
    }
    
}
/**
 设置自定义按钮frame布局
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    //
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    //按钮的frame
    CGFloat buttonW = width / self.subviews.count;
    CGFloat buttonH = height;
    CGFloat buttonY = 0;
    
    for(int index =0; index<self.tabBarButtons.count; index++)
    {
        //取出按钮
        SHTabBarButton *button = self.tabBarButtons[index];
        
        //设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //绑定tag
        button.tag = index;
    }
}

/**
 监听点击自定义按钮
 */
- (void)buttonDidClick:(SHTabBarButton *)sender
{
    //通知代理
    if([self.delegate respondsToSelector:@selector(tabBar:didSlectedButtonFrom:to:)])
    {
        [self.delegate tabBar:self didSlectedButtonFrom:self.selectedButton.tag to:sender.tag];
    }
    
    //更新被选中的按钮
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
}


@end
