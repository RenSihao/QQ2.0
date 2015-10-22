//
//  GroupCellInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/3.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupCellInfo : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *onLineCount;
@property (nonatomic, strong) NSArray  *members;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (GroupCellInfo *)groupCellInfoInit:(NSDictionary *)dict;
@end
