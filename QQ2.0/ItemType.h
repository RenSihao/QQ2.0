//
//  ItemType.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#ifndef ItemType_h
#define ItemType_h
//各种类型的Item
typedef NS_ENUM(NSInteger, SHSettingItemType) {
    SHSettingItemTypeDefault,       // image, title, rightTitle, rightImage
    SHSettingItemTypeDefaultL,      // image, title, leftImage, rightTitle
    SHSettingItemTypeLeft,          // image, title, leftTitle, leftImage
    SHSettingItemTypeButton,        // button
    SHSettingItemTypeAvatar,        // title, avatar
    SHSettingItemTypeMidTitle,      // title
    SHSettingItemTypeSwitch,        // title， Switch
};

#endif /* ItemType_h */
