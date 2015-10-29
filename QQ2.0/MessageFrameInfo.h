//
//  MessageFrameInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MessageInfo;

@interface MessageFrameInfo : NSObject

@property (nonatomic, strong) MessageInfo *messageInfo;
@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect nameFrame;
@property (nonatomic, assign) CGRect timeFrame;
@property (nonatomic, assign) CGRect messageFrame;
@property (nonatomic, assign) CGRect lineFrame;

@property (nonatomic, assign) CGFloat rowHeight;
@end
