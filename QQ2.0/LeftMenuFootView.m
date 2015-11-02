//
//  LeftMenuFootView.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LeftMenuFootView.h"
#define NightSkinIsDown @"nightSkinIsDown"

@interface LeftMenuFootView ()<UIAlertViewDelegate>

@property (nonatomic,weak) UIButton *settingBtn;
@property (nonatomic,weak) UIButton *dayBtn;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) NSTimer *timer;
@property (nonatomic,assign) BOOL nightSkinIsdown;
@property (nonatomic,assign) int count;
@end

@implementation LeftMenuFootView


-(instancetype)init
{
    self = [super init];
    if (self) {
        _nightSkinIsdown = [[NSUserDefaults standardUserDefaults] objectForKey:NightSkinIsDown];
        UIButton *settingBtn = [self buttonWithTitle:@"设置" image:@"sidebar_setting"];
        [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _settingBtn = settingBtn;
        UIButton *dayBtn = [self buttonWithTitle:@"夜间" image:_nightSkinIsdown ? @"sidebar_nightmode_on" : @"sidebar_nightmode_off" ];
        [dayBtn addTarget:self action:@selector(dayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _dayBtn = dayBtn;
        UIView *line = [[UIView alloc] init];
        line.alpha = 0.1;
        line.backgroundColor = [UIColor whiteColor];
        _line = line;
        [self addSubview:line];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _settingBtn.frame = CGRectMake(0, 0, 80, 40);
    _line.frame = CGRectMake(90, 10, 1, 20);
    _dayBtn.frame = CGRectMake(100, 0, 80, 40);
}

-(UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self addSubview:btn];
    return btn;
}

-(void)settingBtnClick
{
    if ([self.delegate respondsToSelector:@selector(LeftMenuFootViewSettingButtonIsClick)]) {
        [self.delegate LeftMenuFootViewSettingButtonIsClick];
    }
}

-(void)dayBtnClick:(UIButton *)btn
{
    //判断皮肤是否下载
    if(_nightSkinIsdown){
        _dayBtn.selected = !btn.selected;
        [_dayBtn setImage:[UIImage imageNamed:_dayBtn.selected ? @"sidebar_nightmode_on" : @"sidebar_nightmode_off"] forState:UIControlStateNormal];
        return;
    }
    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"使用提示" message:@"需要先下载“夜间主题（2.6M）后才可使用，是否立即下载？”" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"夜间模式需要联网进行下载，所需空间1.98M" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
 
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }
    
    //开始旋转
    [_dayBtn setImage:[UIImage imageNamed:@"sidebar_nightmode_loading"] forState:UIControlStateNormal];
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 7;  //转7次
    rotationAnimation.delegate = self;
    [_dayBtn.imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    //添加定时器
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.07 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    _timer = timer;
}

//模拟计数
-(void)timerFired
{
    _count ++;
    if (_count == 101) {
        [_timer invalidate];
        //这里下载完皮肤 就可以发送通知了 修改对应界面，应没有素材 我就没有做了。
        [_dayBtn setImage:[UIImage imageNamed:@"sidebar_nightmode_on"] forState:UIControlStateNormal];
        //存储皮肤下载记录
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"nightSkinIsDown"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        _nightSkinIsdown = YES;
        return;
    }
    
    NSString *str = @"%";
    NSString *count = [NSString stringWithFormat:@"%d",_count];
    [_dayBtn setTitle:[str stringByAppendingString:count] forState:UIControlStateNormal];
}
@end

