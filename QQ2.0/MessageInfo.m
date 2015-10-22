//
//  MessageInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageInfo.h"

@implementation MessageInfo
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (MessageInfo *)messageInfoInit:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSArray *)messageInfoPlist
{
    NSArray *messagePlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Message" ofType:@"plist"]];
    NSMutableArray *messageArray = [NSMutableArray array];
    for(NSDictionary *dict in messagePlist)
    {
        MessageInfo *messageInfo = [[self alloc] initWithDictionary:dict];
        [messageArray addObject:messageInfo];
    }
    return messageArray;
}
@end
