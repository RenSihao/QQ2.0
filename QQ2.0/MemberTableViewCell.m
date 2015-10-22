//
//  ContacterTableViewCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MemberTableViewCell.h"
#import "MemberCellInfo.h"
#define CONTACTER_HEIGHT 50

#define MARGIN 5
#define ICON_WIDTH 40
#define ICON_HEIGHT 40
#define NAME_WIDTH 50
#define NAME_HEIGHT 20
#define VIP_WIDTH 10
#define VIP_HEIGHT 10
#define SIGNAL_WIDTH 10
#define SIGNAL_HEIGHT 10
#define ISONLINE_WIDHT 20
#define ISONLINE_HEIGHT 20
#define INTRO_WIDTH 100
#define INTRO_HEIGHT 20


@interface MemberTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *nameLab;
@property (nonatomic, strong) UIImageView *vipView;
@property (nonatomic, strong) UIImageView *signalView;
@property (nonatomic, strong) UILabel     *isOnLineLab;
@property (nonatomic, strong) UILabel     *introLab;
@end

@implementation MemberTableViewCell

#pragma mark - 接口部分
+ (instancetype)memberTableViewCellInit:(MemberCellInfo *)memberCellInfo withTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"contacter";
    MemberTableViewCell *memberCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(!memberCell)
    {
        memberCell = [[MemberTableViewCell alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 50)];
    }
    memberCell.memberCellInfo = memberCellInfo;
    return memberCell;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLab];
//        [self addSubview:self.vipView];
//        [self addSubview:self.signalView];
        [self addSubview:self.isOnLineLab];
        [self addSubview:self.introLab];
    }
    return self;
}

#pragma mark - 数据更新展示
- (void)setMemberCellInfo:(MemberCellInfo *)memberCellInfo
{
    _memberCellInfo = memberCellInfo;
    self.iconView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.memberCellInfo.icon ofType:@"png"]];
    self.nameLab.text = self.memberCellInfo.name;
    if(self.memberCellInfo.isOnLine == YES)
    {
        self.isOnLineLab.text = @"在线";
    }
    else if(self.memberCellInfo.isOnLine == NO)
    {
        self.isOnLineLab.text = @"离线";
    }
    self.introLab.text = self.memberCellInfo.intro;
    
}
#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if(!_iconView)
    {
        _iconView = [[UIImageView alloc] initWithFrame:({
            CGRect frame = CGRectMake(5, 5, ICON_WIDTH, ICON_HEIGHT);
            frame;
        })];
        
    }
    return _iconView;
}
- (UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [[UILabel alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN+CGRectGetMaxX(self.iconView.frame), MARGIN, NAME_WIDTH, NAME_HEIGHT);
            frame;
        })];
    }
    return _nameLab;
}
- (UIImageView *)vipView
{
    if(!_vipView)
    {
        _nameLab = [[UILabel alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN+CGRectGetMaxX(self.nameLab.frame), MARGIN, VIP_WIDTH, VIP_HEIGHT);
            frame;
        })];
    }
    return _vipView;
}
- (UIImageView *)signalView
{
    if(!_signalView)
    {
        _signalView = [[UIImageView alloc] initWithFrame:({
            CGRect frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-MARGIN-SIGNAL_WIDTH, MARGIN, SIGNAL_WIDTH, SIGNAL_HEIGHT);
            frame;
        })];
    }
    return _signalView;
}
- (UILabel *)isOnLineLab
{
    if(!_isOnLineLab)
    {
        _isOnLineLab = [[UILabel alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN+CGRectGetMaxX(self.iconView.frame), CGRectGetMaxY(self.nameLab.frame), ISONLINE_WIDHT, ISONLINE_HEIGHT);
            frame;
        })];
    }
    return _isOnLineLab;
}
- (UILabel *)introLab
{
    if(!_introLab)
    {
        _introLab = [[UILabel alloc] initWithFrame:({
            CGRect frame = CGRectMake(CGRectGetMaxX(self.isOnLineLab.frame), CGRectGetMaxY(self.nameLab.frame), INTRO_WIDTH, INTRO_HEIGHT);
            frame;
        })];
    }
    return _introLab;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
