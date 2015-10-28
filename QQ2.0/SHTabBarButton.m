//
//  SHTabBarButtonItem.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHTabBarButton.h"

@implementation SHTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:10.0f];
        
        //文字颜色
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:QQDefaultColor forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark - 更新item
//设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    //利用KVO来监听属性是否改变
    [self addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [self addObserver:self forKeyPath:@"title" options:0 context:nil];
    [self addObserver:self forKeyPath:@"image" options:0 context:nil];
    [self addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];  
}
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"badgeValue"];
    [self removeObserver:self forKeyPath:@"title"];
    [self removeObserver:self forKeyPath:@"image"];
    [self removeObserver:self forKeyPath:@"selectedImage"];
}
/**
 监听到某个对象的属性改变了，自动调用此方法
 @prama KeyPath 属性名
 @prama object  哪个对象属性被改变
 @prama change  属性发生的改变
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
}


#pragma mark - 重写内部一些方法

//重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted
{}
//重写内部图片frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.8;
    return CGRectMake(0, 0, imageW, imageH);
}
//重写内部文字frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * 0.8 - 3;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
