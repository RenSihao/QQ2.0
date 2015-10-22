//
//  DynamicInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicInfo : NSObject

@property (nonatomic, strong) NSArray *groupInfoArray;
//利用plist文件实现该类对外接口
+ (NSArray *)dynamicInfoPlist;
- (instancetype)initWithArray:(NSArray *)array;
+ (DynamicInfo *)dynamicInfoWithArray:(NSArray *)array;
@end
