//
//  TalkInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Sender)
{
    SenderSelf,
    SenderOther
};

@interface TalkInfo : NSObject

@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) Sender type;
@property (nonatomic, assign, getter=isHiddenTime) BOOL hiddenTime;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (TalkInfo *)talkInfoInitWithDictionary:(NSDictionary *)dict;
+ (NSArray *)talkInfoPlist;
@end
