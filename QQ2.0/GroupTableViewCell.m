//
//  GroupTableViewCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "GroupTableViewCell.h"
#import "GroupCellInfo.h"

#define GROUP_HEIGHT 30

@interface GroupTableViewCell ()

@property (nonatomic, strong) UIImageView *triangleView;
@property (nonatomic, strong) UILabel     *groupLab;
@property (nonatomic, strong) UILabel     *onLineLab;
@end

@implementation GroupTableViewCell

#pragma mark - 接口部分
+ (instancetype)groupTableViewCellInit:(GroupCellInfo *)groupCellInfo withTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"group";
    GroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(!cell)
    {
        cell = [[GroupTableViewCell alloc] initWithFrame:
                                    CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, GROUP_HEIGHT)];
    }
    cell.groupCellInfo = groupCellInfo;
    return cell;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.triangleView];
        [self addSubview:self.groupLab];
        [self addSubview:self.onLineLab];
    }
    return self;
}
#pragma mark - 更新数据展示
- (void)setGroupCellInfo:(GroupCellInfo *)groupCellInfo
{
    _groupCellInfo = groupCellInfo;
    self.groupLab.text  = self.groupCellInfo.name;
    self.onLineLab.text = [NSString stringWithFormat:@"%ld/%ld", [self.groupCellInfo.onLineCount integerValue], self.groupCellInfo.members.count];
    
}
#pragma mark - 懒加载
- (UIImageView *)triangleView
{
    if(!_triangleView)
    {
        _triangleView = [[UIImageView alloc] initWithFrame:
                         CGRectMake(10, 10, 20, GROUP_HEIGHT-10)];
        _triangleView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"buddy_header_arrow@2x" ofType:@"png"]];
    }
    return _triangleView;
}
- (UILabel *)groupLab
{
    if(!_groupLab)
    {
        _groupLab = [[UILabel alloc] initWithFrame:CGRectMake(5+CGRectGetMaxX(self.triangleView.frame), 10, 285, GROUP_HEIGHT-10)];
        [_groupLab setTextAlignment:NSTextAlignmentLeft];
        [_groupLab setFont:[UIFont boldSystemFontOfSize:15.0f]];
    }
    return _groupLab;
}
- (UILabel *)onLineLab
{
    if(!_onLineLab)
    {
        _onLineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.groupLab.frame), 10, 50, GROUP_HEIGHT-10)];
        [_onLineLab setTextAlignment:NSTextAlignmentRight];
        [_onLineLab setFont:[UIFont systemFontOfSize:10.0f]];
    }
    return _onLineLab;
}
/*--------------------------------------------------------------------------------------------------*/

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
