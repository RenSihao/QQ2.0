//
//  LeftCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LeftCell.h"

@implementation LeftCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIView *line = [[UIView alloc] init];
        line.tag = 1;
        line.hidden = YES;
        line.alpha = 0.1;
        line.backgroundColor = [UIColor blackColor];
        [self addSubview:line];
    }
    return self;
}

-(void)setLineIsHidden:(BOOL)lineIsHidden
{
    UIView *line = [self viewWithTag:1];
    line.hidden = lineIsHidden;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIView *line = [self viewWithTag:1];
    line.frame = CGRectMake(15, self.frame.size.height, self.frame.size.width - 15, 1);
}



@end
