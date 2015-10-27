//
//  CommonTableViewCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "UIView+TL.h"

@implementation CommonTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _topLineStyle = CellLineStyleNone;
        _bottomLineStyle = CellLineStyleDefault;
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [self.topLine setOriginY:0];
    [self.bottomLine setOriginY:self.frameHeight - _bottomLine.frameHeight];
    [self setBottomLineStyle:_bottomLineStyle];
    [self setTopLineStyle:_topLineStyle];
}

- (void) setTopLineStyle:(CellLineStyle)style
{
    _topLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.topLine setOriginX:_leftFreeSpace];
        [self.topLine setFrameWidth:self.frameWidth - _leftFreeSpace];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self.topLine setOriginX:0];
        [self.topLine setFrameWidth:self.frameWidth];
        [self.topLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.topLine setHidden:YES];
    }
}

- (void) setBottomLineStyle:(CellLineStyle)style
{
    _bottomLineStyle = style;
    if (style == CellLineStyleDefault) {
        [self.bottomLine setOriginX:_leftFreeSpace];
        [self.bottomLine setFrameWidth:self.frameWidth - _leftFreeSpace];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleFill) {
        [self.bottomLine setOriginX:0];
        [self.bottomLine setFrameWidth:self.frameWidth];
        [self.bottomLine setHidden:NO];
    }
    else if (style == CellLineStyleNone) {
        [self.bottomLine setHidden:YES];
    }
}

- (UIView *) bottomLine
{
    if (_bottomLine == nil) {
        _bottomLine = [[UIView alloc] init];
        [_bottomLine setFrameHeight:0.5f];
        [_bottomLine setBackgroundColor:[UIColor grayColor]];
        [_bottomLine setAlpha:0.3];
        [self.contentView addSubview:_bottomLine];
    }
    return _bottomLine;
}

- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setFrameHeight:0.5f];
        [_topLine setBackgroundColor:[UIColor grayColor]];
        [_topLine setAlpha:0.3];
        [self.contentView addSubview:_topLine];
    }
    return _topLine;
}

@end
