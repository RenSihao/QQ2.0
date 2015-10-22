//
//  TalkFrameInfo.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class TalkInfo;

@interface TalkFrameInfo : NSObject

@property (nonatomic, strong) TalkInfo *talkInfo;
@property (nonatomic, assign) CGRect timeFrame;
@property (nonatomic, assign) CGRect iconFrame;
@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGFloat rowHeight;

@end
