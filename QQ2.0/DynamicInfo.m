//
//  DynamicInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "DynamicInfo.h"
#import "DynamicCellInfo.h"

@implementation DynamicInfo
+ (DynamicInfo *)dynamicInfoWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}
- (instancetype)initWithArray:(NSArray *)array
{
    if(self = [super init])
    {
        self.groupInfoArray = array;
    }
    return self;
}
+ (NSArray *)dynamicInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Dynamic" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    
    for(NSArray *groupInfoArray in array)
    {
        DynamicInfo *dynamicInfo = [self dynamicInfoWithArray:groupInfoArray];
        /*-------------------数据模型内嵌其他数据模型---------------*/
        NSMutableArray *dynamicCellArray = [NSMutableArray array];
        for(NSDictionary *dynamicCellDict in dynamicInfo.groupInfoArray)
        {
            DynamicCellInfo *dynamicCellInfo = [DynamicCellInfo dynamicCellInfoWithDictonary:dynamicCellDict];
            [dynamicCellArray addObject:dynamicCellInfo];
        }
        /*----------------------分割线------------------*/
        dynamicInfo.groupInfoArray = dynamicCellArray;
        [modeArray addObject:dynamicInfo];
    }
    return modeArray;
}



@end
