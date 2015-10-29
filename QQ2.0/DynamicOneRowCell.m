//
//  DynamicOneRowCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicOneRowCell.h"

@interface DynamicOneRowCell ()

@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSMutableArray *labArray;
@end



@implementation DynamicOneRowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _btnArray = [NSMutableArray array];
        _labArray = [NSMutableArray array];
        
        NSArray *imageName = @[@"found_icons_qzone", @"found_icons_location", @"found_icons_group_buluo"];
        NSArray *titleArray = @[@"好友动态", @"附近", @"兴趣部落"];
        
        //循环搭建动态控制器第一行cell视图
        for(int i=0; i<3; i++)
        {
            UIButton *button = [self buttonWithImage:[UIImage imageNamed:imageName[i]]];
            button.tag = i;
            [button addTarget:self action:@selector(buttonItemDidClick:) forControlEvents:UIControlEventTouchUpInside];
            [_btnArray addObject:button];
            [self addSubview:button];
            
            
            UILabel *label = [self labelWithTitle:titleArray[i]];
            [_labArray addObject:label];
            [self addSubview:label];
            
        }
        
    }
    return self;
}
/**
 子控件重新布局
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //
    CGFloat btnW = [UIScreen mainScreen].bounds.size.width / _btnArray.count;
    for(int i=0; i<_btnArray.count; i++)
    {
        UIButton *button = _btnArray[i];
        button.frame = CGRectMake(i*btnW, 0, btnW, 60);
        
        UILabel *label = _labArray[i];
        label.frame = CGRectMake(i*btnW, 60, btnW, 20);
    }
}


/**
 自定义UIButton便利构造器
 */
- (UIButton *)buttonWithImage:(UIImage *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    
    return button;
}
/**
 自定义UILabel便利构造器
 */
- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:12 ];
    return label;
}
/**
 监听点击事件
 */
- (void)buttonItemDidClick:(UIButton *)sender
{
    NSLog(@"动态视图第一行cell中 tag为%ld 被点击", sender.tag);
    
}


@end
