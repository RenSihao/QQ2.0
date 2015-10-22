//
//  TalkFrameInfo.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "TalkFrameInfo.h"
#import "TalkInfo.h"

@implementation TalkFrameInfo

- (void)setTalkInfo:(TalkInfo *)talkInfo
{
    _talkInfo = talkInfo;
    UIScreen *screen  = [UIScreen mainScreen];
    CGSize screenSize = screen.bounds.size;
    CGFloat margin = 10;
    
    //timeFrame
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screenSize.width;
    CGFloat timeH= 20;
    if(!self.talkInfo.isHiddenTime)
    {
        self.timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    //iconFrame
    CGFloat iconX;
    CGFloat iconY = timeY + margin;
    CGFloat iconW = 50;
    CGFloat iconH = 50;
    if(self.talkInfo.type == SenderSelf)
    {
        iconX = screenSize.width - margin - iconW;
    }
    else if(self.talkInfo.type == SenderOther)
    {
        iconX = margin;
    }
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //textFrame
    CGRect textRect = [self.talkInfo.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]} context:nil];
    CGSize textSize = textRect.size;
    CGSize btnSize = CGSizeMake(textSize.width+40, textSize.height+40);
    CGFloat textX;
    CGFloat textY = self.iconFrame.origin.y + iconH/3;
    CGFloat textW = btnSize.width;
    CGFloat textH = btnSize.height;
    if(self.talkInfo.type == SenderSelf)
    {
        textX = screenSize.width - 2*margin - self.iconFrame.size.width - btnSize.width;
    }
    else if(self.talkInfo.type == SenderOther)
    {
        textX = CGRectGetMaxX(self.iconFrame) + margin;
    }
    self.textFrame = CGRectMake(textX, textY, textW, textH);
    
    //cell的行高
    self.rowHeight = MAX(CGRectGetMaxY(self.iconFrame), CGRectGetMaxY(self.textFrame));
    

    
    
    
}
@end
