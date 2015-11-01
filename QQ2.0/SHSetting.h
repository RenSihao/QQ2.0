//
//  SHSetting.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemType.h"

/**
 声明单个Item类
 */
@interface SHSettingItem : NSObject

@property (nonatomic, assign) SHSettingItemType type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *subImageName;
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, copy) NSURL *subImageURL;

- (id)initWithTitle:(NSString *)title;
- (id)initWithTitle:(NSString *)title type:(SHSettingItemType)type;
- (id)initWithTitle:(NSString *)title imageName:(NSString *)imageName;
- (id)initWithTitle:(NSString *)title images:(NSMutableArray *)images;
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle type:(SHSettingItemType)type;
- (id)initWithTitle:(NSString *)title subImageName:(NSString *)subImageName type:(SHSettingItemType)type;

- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName;
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageName:(NSString *)subImageName type:(SHSettingItemType)type;
- (id)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName subImageURL:(NSString *)subImageURL type:(SHSettingItemType)type;

@end

/**
  声明一组Item类
 */
@interface SHSettingGroup : NSObject

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, strong) NSMutableArray *itmes;
@property (nonatomic, assign) NSUInteger  itemsCount;

- (id)initWithHeaderTitle:(NSString *)headerTitle footerTitle:(NSString *)footerTitle settingItems:(SHSettingItem *)item1,...;
- (SHSettingItem *)itemAtIndex:(NSUInteger)index;

@end





