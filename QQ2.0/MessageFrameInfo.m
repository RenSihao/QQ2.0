//
//  MessageFrameInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageFrameInfo.h"
#import "MessageInfo.h"

@implementation MessageFrameInfo

- (void)setMessageInfo:(MessageInfo *)messageInfo
{
    _messageInfo = messageInfo;
    //
    CGFloat margin = 5;
    
    //设置icon
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //设置name
    CGSize nameMaxSize = CGSizeMake(275, 30);
    CGRect nameRect = [self.messageInfo.name boundingRectWithSize:nameMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f]} context:nil];
    CGFloat nameX = margin+CGRectGetMaxX(self.iconFrame);
    CGFloat nameY = margin;
    CGFloat nameW = nameRect.size.width;
    CGFloat nameH = nameRect.size.height;
    self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    //设置time
    CGSize timeMaxSize = CGSizeMake(30, 10);
    CGRect timeRect = [self.messageInfo.time boundingRectWithSize:timeMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f]} context:nil];
    
    CGFloat timeX = [[UIScreen mainScreen] bounds].size.width-2*margin-timeRect.size.width;
    CGFloat timeY = margin;
    CGFloat timeW = timeRect.size.width;
    CGFloat timeH = timeRect.size.height;
    self.timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    
    //设置message
    CGSize messageMaxSize = CGSizeMake(310, 10);
    CGRect messageRect  = [self.messageInfo.message boundingRectWithSize:messageMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil];
    CGFloat messageX = margin+CGRectGetMaxX(self.iconFrame);
    CGFloat messageY = 2*margin+CGRectGetMaxY(self.nameFrame);
    CGFloat messageW = messageRect.size.width;
    CGFloat messageH = messageRect.size.height;
    self.messageFrame = CGRectMake(messageX, messageY, messageW, messageH);
    
    //设置line
    CGFloat lineX = self.nameFrame.origin.x;
    CGFloat lineY = CGRectGetMaxY(self.iconFrame) + 4;
    CGFloat lineW = [UIScreen mainScreen].bounds.size.width - lineX;
    CGFloat lineH = 1;
    self.lineFrame = CGRectMake(lineX, lineY, lineW, lineH);
    
    //cell的高度固定（经过设计）
    self.rowHeight = 60;
    
}

@end
