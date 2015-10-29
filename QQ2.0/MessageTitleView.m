//
//  MessageTitleView.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageTitleView.h"

@interface MessageTitleView ()

@property (nonatomic, weak) UIButton *selectedBtn;
@end

@implementation MessageTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        CGFloat btnW = 58;
        UIButton *messageBtn = [self buttonWithTitle:@"消息" nor:@"header_lefttab_nor" hight:@"header_lefttab_highlighted" sel:@"header_lefttab_press"];
        messageBtn.frame = CGRectMake(0, 5, btnW, 30);
        messageBtn.tag = 1;
        
        UIButton *phoneBtn = [self buttonWithTitle:@"电话" nor:@"header_righttab_nor" hight:@"header_righttab_highlighted" sel:@"header_righttab_press"];
        phoneBtn.frame = CGRectMake(btnW, 5, btnW, 30);
        phoneBtn.tag = 2;
        
        //默认messageBtn打开
        [self btnDidClick:messageBtn];
    }
    return self;
}

/**
 绘制 消息视图 导航栏中间控件，在UIButton基础上修改
 */
- (UIButton *)buttonWithTitle:(NSString *)title nor:(NSString *)nor hight:(NSString *)hight sel:(NSString *)sel
{
    UIEdgeInsets edge;
    if([title isEqualToString:@"消息"])
    {
        edge = UIEdgeInsetsMake(10, 12, 10, 0); // 上 左 下 右
    }
    else
    {
        edge = UIEdgeInsetsMake(10, 1, 10, 20);
    }
    
    //将图片拉伸
    UIImage *old = [UIImage imageNamed:nor];
    UIImage *new = [old resizableImageWithCapInsets:edge];
    
    UIImage *oldH= [UIImage imageNamed:hight];
    UIImage *newH = [oldH resizableImageWithCapInsets:edge];
    
    UIImage *oldS= [UIImage imageNamed:sel];
    UIImage *newS = [oldS resizableImageWithCapInsets:edge];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:new forState:UIControlStateNormal];
    [btn setBackgroundImage:newH forState:UIControlStateHighlighted];
    [btn setBackgroundImage:newS forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:QQDefaultColor forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    
    [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    return btn;
 
}

#pragma mark - 监听点击事件
- (void)btnDidClick:(UIButton *)sender
{
    if(sender.tag == 1)
    {
        NSLog(@"消息视图导航栏自定义中间视图 消息部分 被点击");
    }
    else
    {
        NSLog(@"消息视图导航栏自定义中间视图 电话部分 被点击");
    }
    
    _selectedBtn.selected = NO;
    sender.selected = YES;
    _selectedBtn = sender;
}



@end
