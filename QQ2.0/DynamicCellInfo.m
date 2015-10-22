//
//  DynamicCellInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicCellInfo.h"

@implementation DynamicCellInfo
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (DynamicCellInfo *)dynamicCellInfoWithDictonary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
