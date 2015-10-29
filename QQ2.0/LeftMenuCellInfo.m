//
//  LeftMenuCellInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LeftMenuCellInfo.h"

@implementation LeftMenuCellInfo

+ (instancetype)initWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (NSArray *)cellDataFromPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LeftMenuCell" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in array)
    {
        LeftMenuCellInfo *cellInfo = [LeftMenuCellInfo initWithDictionary:dict];
        [modeArray addObject:cellInfo];
    }
    return modeArray;
}

@end
