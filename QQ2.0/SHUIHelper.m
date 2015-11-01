//
//  SHUIHelper.m
//  QQ2.0
//
//  Created by RenSihao on 15/11/1.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SHUIHelper.h"
#import "SHSetting.h"

@implementation SHUIHelper

+ (NSMutableArray *)getDynamicItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SHSettingItem *album = [[SHSettingItem alloc] initWithTitle:@"游戏" subTitle:@"全民超神" imageName:@"found_icons_gamecenter@3x" subImageName:@"aio_icons_favorite@3x"];
    SHSettingItem *favorite = [[SHSettingItem alloc] initWithTitle:@"购物" imageName:@"found_icons_group_buluo@3x"];
    SHSettingItem *bank = [[SHSettingItem alloc] initWithTitle:@"阅读" imageName:@"found_icons_gamecenter@3x"];
    SHSettingItem *card = [[SHSettingItem alloc] initWithTitle:@"音乐" imageName:@"found_icons_group_buluo@3x"];
    SHSettingGroup *group1 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:album, favorite, bank, card,nil];
    [items addObject:group1];
    
    
    SHSettingItem *expression = [[SHSettingItem alloc] initWithTitle:@"附近的群" imageName:@"found_icons_gamecenter@3x"];
    SHSettingItem *expression1 = [[SHSettingItem alloc] initWithTitle:@"吃喝玩乐" imageName:@"found_icons_group_buluo@3x"];
    SHSettingItem *expression2 = [[SHSettingItem alloc] initWithTitle:@"同城服务" imageName:@"found_icons_gamecenter@3x"];
    SHSettingItem *expression3 = [[SHSettingItem alloc] initWithTitle:@"健康" imageName:@"found_icons_group_buluo@3x"];
    SHSettingGroup *group2 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:expression, expression1,expression2,expression3, nil];
    [items addObject:group2];
    
    return items;
}

+ (NSMutableArray *)getSettingItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    SHSettingItem *item = [[SHSettingItem alloc] initWithTitle:@"账户管理" imageName:@"qqstar2"];
    SHSettingItem *item1 = [[SHSettingItem alloc] initWithTitle:@"手机号码" subTitle:@"未绑定"];
    SHSettingItem *item2 = [[SHSettingItem alloc] initWithTitle:@"QQ达人" subTitle:@"76天"];
    SHSettingGroup *group = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item, item1,item2, nil];
    [items addObject:group];
    
    
    SHSettingItem *item3 = [[SHSettingItem alloc] initWithTitle:@"消息通知"];
    SHSettingItem *item4 = [[SHSettingItem alloc] initWithTitle:@"聊天记录"];
    SHSettingGroup *group1 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item3, item4, nil];
    [items addObject:group1];
    
    SHSettingItem *item5 = [[SHSettingItem alloc] initWithTitle:@"联系人、隐私"];
    SHSettingItem *item6 = [[SHSettingItem alloc] initWithTitle:@"设备锁" subTitle:@"已经开启"];
    SHSettingItem *item7 = [[SHSettingItem alloc] initWithTitle:@"辅助功能"];
    SHSettingGroup *group3 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item5, item6,item7, nil];
    [items addObject:group3];
    
    SHSettingItem *item8 = [[SHSettingItem alloc] initWithTitle:@"关于QQ与帮助"];
    SHSettingGroup *group4 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item8, nil];
    [items addObject:group4];
    return items;

      
    
}

+ (NSMutableArray *)getContactItems
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    SHSettingItem *myEquipment = [[SHSettingItem alloc] initWithTitle:@"我的设备" subTitle:@"2/2" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *phoneAB = [[SHSettingItem alloc] initWithTitle:@"手机通讯录" subTitle:@"40/78" imageName:@"userinfo_arrow@2x" subImageName:nil];
    
    SHSettingGroup *group1 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:myEquipment, phoneAB, nil];
    [items addObject:group1];
    
    
    SHSettingItem *item1 = [[SHSettingItem alloc] initWithTitle:@"分组一" subTitle:@"1/1" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *item2 = [[SHSettingItem alloc] initWithTitle:@"分组二" subTitle:@"2/12" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *item3 = [[SHSettingItem alloc] initWithTitle:@"分组三" subTitle:@"35/40" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *item4 = [[SHSettingItem alloc] initWithTitle:@"分组四" subTitle:@"12/16" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *item5 = [[SHSettingItem alloc] initWithTitle:@"分组五" subTitle:@"33/59" imageName:@"userinfo_arrow@2x" subImageName:nil];
    SHSettingItem *item6 = [[SHSettingItem alloc] initWithTitle:@"分组六" subTitle:@"4/14" imageName:@"userinfo_arrow@2x" subImageName:nil];
    
    SHSettingGroup *group2 = [[SHSettingGroup alloc] initWithHeaderTitle:nil footerTitle:nil settingItems:item1, item2, item3, item4, item5, item6, nil];
    [items addObject:group2];
    
    
    return items;
}

@end
