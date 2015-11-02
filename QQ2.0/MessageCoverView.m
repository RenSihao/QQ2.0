//
//  MessageCoverView.m
//  QQ2.0
//
//  Created by RenSihao on 15/11/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageCoverView.h"

@interface MessageCoverView ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) UIView *coverView; //蒙板
@property (nonatomic, strong) UIView *popView; //跳出来的第一响应视图
@end



@implementation MessageCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //插入这个蒙板
        [self insertSubview:self.coverView atIndex:0];
        
        //添加这个跳出来显示的第一响应视图
        [self addSubview:self.popView];
        
        
        //给popView添加按钮
        UIButton *btn1 = [self buttonWithTitle:@"扫一扫" image:@"right_menu_QR"];
        btn1.frame = CGRectMake(0, 0, 125, 40);
        
        UIButton *btn2 = [self buttonWithTitle:@"加好友" image:@"right_menu_addFri"];
        btn2.frame = CGRectMake(0, 40, 125, 40);
        
        UIButton *btn3 = [self buttonWithTitle:@"创建讨论组" image:@"right_menu_multichat"];
        btn3.frame = CGRectMake(0, 80, 125, 40);
        
        UIButton *btn4 = [self buttonWithTitle:@"发送到电脑" image:@"right_menu_sendFile"];
        btn4.frame = CGRectMake(0, 120, 125, 40);
        
        UIButton *btn5 = [self buttonWithTitle:@"面对面快传" image:@"right_menu_facetoface"];
        btn5.frame = CGRectMake(0,160, 125, 40);
        
        UIButton *btn6 = [self buttonWithTitle:@"收钱" image:@"right_menu_payMoney"];
        btn6.frame = CGRectMake(0,200, 125, 40);
        
        
        //给popView添加线
        for (int i = 0; i < _btnArray.count; i++)
        {
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor blackColor];
            line.alpha = 0.1;
            line.frame = CGRectMake(0, i * 40, 125, 1);
            [_popView addSubview:line];
        }

    }
    
    
    return self;
}
- (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"app_share_popup_button_right_press"] forState:UIControlStateHighlighted];
    
    [_popView addSubview:btn];
    [self.btnArray addObject:btn];
    return btn;
}
//懒加载蒙板
- (UIView *)coverView
{
    if(!_coverView)
    {
        //如何使得蒙板也覆盖在TabBar上？？
        _coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.1f;
    }
    return _coverView;
}
//懒加载跳出视图
- (UIView *)popView
{
    if(!_popView)
    {
        _popView = [[UIView alloc] init];
        //....
        _popView.frame = CGRectMake(SCREEN_WIDTH-75, -114, 125, 240);
        _popView.backgroundColor = [UIColor whiteColor];
        _popView.layer.cornerRadius = 4;
        _popView.alpha = 0.1;
        _popView.clipsToBounds = YES;
    }
    return _popView;
}

//监听点击
- (void)coverClick
{
    [self hidden];
}

//显示
- (void)show
{
    self.hidden = NO;
    //设置锚点
    _popView.layer.anchorPoint = CGPointMake(1, 0);
    //从最小放到最大
    _popView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration:0.5 animations:^{
        _popView.alpha = 1.0;
        _popView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
    
    
}
//缩小直至隐藏
- (void)hidden
{
    //从最大缩放回去，然后将自身隐藏
    [UIView animateWithDuration:0.5f animations:^{
        _popView.alpha = 0.1;
        _popView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
    
    
}

@end
