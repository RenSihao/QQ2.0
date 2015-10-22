//
//  DynamicCellInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/2.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicCellInfo : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (DynamicCellInfo *)dynamicCellInfoWithDictonary:(NSDictionary *)dict;
@end
