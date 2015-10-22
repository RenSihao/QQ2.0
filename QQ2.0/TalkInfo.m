//
//  TalkInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "TalkInfo.h"

@implementation TalkInfo
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (TalkInfo *)talkInfoInitWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSArray *)talkInfoPlist
{
    NSArray *talkArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Talk" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in talkArray)
    {
        TalkInfo *talkInfo = [TalkInfo talkInfoInitWithDictionary:dict];
        [modeArray addObject:talkInfo];
    }
    return modeArray;
}
@end
