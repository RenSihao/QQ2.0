//
//  GroupCellInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/3.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "GroupCellInfo.h"

@implementation GroupCellInfo
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (GroupCellInfo *)groupCellInfoInit:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
@end
