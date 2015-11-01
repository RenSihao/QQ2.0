//
//  ContacterOneRowCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/28.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "ContacterOneRowCell.h"

@interface ContacterOneRowCell ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *labArray;

@property (nonatomic, strong) UIView *line;
@end



@implementation ContacterOneRowCell
/**
 重写init方法，创建
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {   
        _btnArray = [NSMutableArray array];
        _labArray = [NSMutableArray array];
        
        NSArray *buttonImage = @[@"buddy_header_icon_newfriend", @"found_icons_location-1", @"buddy_header_icon_group", @"buddy_header_icon_public"];
        NSArray *labelTitle = @[@"新朋友", @"特别关心", @"群组", @"公众号"];
        
        //循环搭建联系人视图中头部那一行的cell
        for(int i=0; i<4; i++)
        {
            UIButton *button = [self buttonWithImage:[UIImage imageNamed:buttonImage[i]]];
            button.tag = i;
            [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.btnArray addObject:button];
            [self addSubview:button];

            UILabel *label = [self labelWithTitle:labelTitle[i]];
            [self.labArray addObject:label];
            [self addSubview:label];
            
        }
        
        //一行cell的底部分割线，原版并没有
//        UIView *line = [[UIView alloc] init];
//        line.backgroundColor = [UIColor blackColor];
//        line.alpha = 0.1;
//        _line = line;
//        [self addSubview:line];
        
    }
    return self;
}
//- (BOOL)isSelected
//{
//    return NO;
//}
/**
 一般情况下，有关控件的frame布局都写在此方法中
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //cell元素中按钮和标签的frame设置
    CGFloat btnW = self.frame.size.width / _btnArray.count;
    for(int i=0; i<_btnArray.count; i++)
    {
        UIButton *button = _btnArray[i];
        button.frame = CGRectMake(i*btnW, 0, btnW, 60);
        NSLog(@"x %lf", button.frame.origin.x);
        
        UILabel *label = _labArray[i];
        label.frame = CGRectMake(i*btnW, 50, btnW, 20);
        
    }
    
    //cell的底部分割线
    _line.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
    
}

/**
 按钮构造便利器和标签构造便利器
 */
- (UIButton *)buttonWithImage:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    
    
    return button;
}
- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *lab = [[UILabel alloc] init];
    lab.text = title;
    lab.font = [UIFont boldSystemFontOfSize:12.0f];
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    
   
    return lab;
}

#pragma mark - 监听点击事件
- (void)buttonDidClick:(UIButton *)sender
{
    NSLog(@"联系人视图中头部那一行的cell 按钮tag %ld 被点击", sender.tag);
}



@end
