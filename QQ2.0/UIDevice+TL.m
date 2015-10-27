//
//  UIDevice+PVZ.m
//  PlantsVsZombies
//
//  Created by h1r0 on 15/8/29.
//  Copyright (c) 2015年 lbk. All rights reserved.
//

#import "UIDevice+TL.h"

@implementation UIDevice (TL)

+ (DeviceVerType)deviceVerType{
    if ([UIScreen mainScreen].bounds.size.width == 375) {
        return DeviceVer6;
    }else if ([UIScreen mainScreen].bounds.size.width == 414){
        return DeviceVer6P;
    }else if([UIScreen mainScreen].bounds.size.height == 480){
        return DeviceVer4;
    }else if ([UIScreen mainScreen].bounds.size.height == 568){
        return DeviceVer5;
    }
    return DeviceVer4;
}

@end
