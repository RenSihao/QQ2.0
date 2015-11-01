//
//  SHSetting.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHSetting.h"

@implementation SHSettingItem

- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName
{
    return [self initWithTitle:title subTitle:subTitle imageName:imageName subImageName:subImageName type:SHSettingItemTypeDefault];
}
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName type:(SHSettingItemType)type
{
    if(self = [super init])
    {
        _title = title;
        _subTitle = subTitle;
        _imageName = imageName;
        _subImageName = subImageName;
        _subImageURL = nil;
        _type = type;
    }
    return self;
}
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageURL:(NSURL*)subImageURL type:(SHSettingItemType)type
{
    if(self = [super init])
    {
        _title = title;
        _subTitle = subTitle;
        _imageName = imageName;
        _subImageName = nil;
        _subImageURL = subImageURL;
        _type = type;
    }
    return self;
}
- (id)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:nil type:SHSettingItemTypeDefault];
}
- (id)initWithTitle:(NSString *)title type:(SHSettingItemType)type
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:nil type:type];
}
- (id)initWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    return [self initWithTitle:title subTitle:nil imageName:imageName subImageName:nil type:SHSettingItemTypeDefault];
}
- (id)initWithTitle:(NSString *)title images:(NSMutableArray *)images
{
    _images = images;
    return [self initWithTitle:title images:images];
}
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle
{
    return [self initWithTitle:title subTitle:subTitle imageName:nil subImageName:nil type:SHSettingItemTypeDefault];
}
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle type:(SHSettingItemType)type
{
    return [self initWithTitle:title subTitle:subTitle imageName:nil subImageName:nil type:SHSettingItemTypeDefault];
}
- (id)initWithTitle:(NSString *)title subImageName:(NSString *)subImageName type:(SHSettingItemType)type
{
    return [self initWithTitle:title subTitle:nil imageName:nil subImageName:subImageName type:SHSettingItemTypeDefault];
}

@end

@implementation SHSettingGroup

- (id)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(SHSettingItem *)item1, ...
{
    if(self = [super init])
    {
        _headerTitle = headerTitle;
        _footerTitle = footerTitle;
        _itmes = [NSMutableArray array];
        if (item1)
        {
            [_itmes addObject:item1];
            
            //纯C实现，添加不定长元素
            va_list argList;
            va_start(argList, item1);
            id arg;
            while ((arg = va_arg(argList, id)))
            {
                [_itmes addObject:arg];
            }
            va_end(argList);
        }
    }
    return self;
    
}
- (SHSettingItem *)itemAtIndex:(NSUInteger)index
{
    return [_itmes objectAtIndex:index];
}
- (NSUInteger)itemsCount
{
    return  _itmes.count;
}








@end





