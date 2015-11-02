//
//  QQZoneHeaderView.m
//  QQ2.0
//
//  Created by RenSihao on 15/11/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "QQZoneHeaderView.h"

@interface QQZoneHeaderView ()

@property (nonatomic, strong) UIView *toolView;
@property (nonatomic, strong) UIButton *sayBtn;
@property (nonatomic, strong) UIButton *imgBtn;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *lineArray;
@end

@implementation QQZoneHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    
    if(self = [super initWithFrame:frame])
    {
        
        _btnArray = [NSMutableArray array];
        _lineArray = [NSMutableArray array];
        
        //设置背景
        UIImage *backGroundImage = [UIImage imageNamed:@"usersummary_cover_default_pic-1"];
        self.layer.contents = (__bridge id _Nullable)(backGroundImage.CGImage);
        
        [self setBackgroundColor:[UIColor blueColor]];
        
        
        //添加按钮
        UIButton *btn1 = [self buttonWithTitle:@"相册"];
        btn1.tag = 1;
        [self addSubview:btn1];
        
        UIButton *btn2 = [self buttonWithTitle:@"说说"];
        btn2.tag = 2;
        [self addSubview:btn2];
        
        UIButton *btn3 = [self buttonWithTitle:@"个性化"];
        btn3.tag = 3;
        [self addSubview:btn3];
        
        UIButton *btn4 = [self buttonWithTitle:@"@ 与我相关"];
        btn4.tag = 4;
        [self addSubview:btn4];
        
      
        //添加线
        for (int i = 0; i < _btnArray.count; i ++) {
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor whiteColor];
            line.alpha = 0.2;
            [_lineArray addObject:line];
            [self addSubview:line];
        }
        
        
        
        //添加底部工具栏
        UIView *toolView = [[UIView alloc] init];
        _toolView = toolView;
        toolView.backgroundColor = [UIColor blackColor];
        toolView.alpha = 0.3;
        [self addSubview:toolView];
        
        //添加说说按钮
        UIButton *sayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sayBtn.tag = 5;
        [sayBtn setTitle:@"说点什么吧..." forState:0];
        [sayBtn setTitleColor:[UIColor grayColor] forState:0];
        sayBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        sayBtn.backgroundColor = [UIColor whiteColor];
        sayBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -170, 0, 0);
        [sayBtn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        _sayBtn = sayBtn;
        [self addSubview:sayBtn];
        
        //图片按钮
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imageBtn.tag = 6;
        [imageBtn setImage:[UIImage imageNamed:@"aio_image_default"] forState:0];
        imageBtn.backgroundColor = [UIColor whiteColor];
        [imageBtn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        _imgBtn = imageBtn;
        [self addSubview:imageBtn];
        
        
        
        
        
    }
    
    return self;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat topViewH = 40;
    CGFloat sayBtnH = 45;
    _toolView.frame = CGRectMake(0, self.frame.size.height - topViewH - sayBtnH, self.frame.size.width, topViewH);
    //
    CGFloat btnW = self.frame.size.width / _btnArray.count;
    for(int i=0; i<_btnArray.count; i++)
    {
        UIButton *btn = _btnArray[i];
        btn.frame = CGRectMake(btnW * i, self.frame.size.height - topViewH - sayBtnH, btnW, topViewH);
        UIView *line = _lineArray[i];
        line.frame = CGRectMake((i +1) * btnW, self.frame.size.height - topViewH + 13 - sayBtnH, 1, topViewH - 26);
    }
    _sayBtn.frame = CGRectMake(0, CGRectGetMaxY(_toolView.frame), self.frame.size.width - 45, sayBtnH);
    _imgBtn.frame = CGRectMake(CGRectGetMaxX(_sayBtn.frame), _sayBtn.frame.origin.y, sayBtnH, sayBtnH);
}


- (UIButton *)buttonWithTitle:(NSString *)title
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [_btnArray addObject:btn];
    return btn;
}
#pragma mark - 监听事件
- (void)buttonDidClick:(UIButton *)sender
{
    NSLog(@"sender tag %ld", sender.tag);
}















@end
