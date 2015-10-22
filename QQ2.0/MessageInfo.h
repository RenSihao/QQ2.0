//
//  MessageInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInfo : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *message;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (MessageInfo *)messageInfoInit:(NSDictionary *)dict;
+ (NSArray *)messageInfoPlist;
@end
