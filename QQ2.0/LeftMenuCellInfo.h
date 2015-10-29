//
//  LeftMenuCellInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeftMenuCellInfo : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

+(instancetype)initWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (NSArray *)cellDataFromPlist;
@end
