//
//  GroupInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/3.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactInfo : NSObject

@property (nonatomic, strong) NSArray *sectionArray;
- (instancetype)initWithArray:(NSArray *)array;
+ (ContactInfo *)contactInfoInit:(NSArray *)array;
+ (NSArray *)contactInfoPlist;
@end
