//
//  PersonInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MemberCellInfo : NSObject

@property (nonatomic, copy)   NSString *icon;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *intro;
@property (nonatomic, assign) BOOL      isOnLine ;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (MemberCellInfo *)memberCellInfoWithDictionary:(NSDictionary *)dict;
@end
