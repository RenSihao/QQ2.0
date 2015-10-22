//
//  MessageTableViewCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/4.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "MessageInfo.h"
#import "MessageFrameInfo.h"
#define Cell_Height 60
#define Margin 5

@interface MessageTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *nameLab;
@property (nonatomic, strong) UILabel     *timeLab;
@property (nonatomic, strong) UILabel     *messageLab;
@end

@implementation MessageTableViewCell

#pragma mark - 接口部分
+ (MessageTableViewCell *)messageTableViewCellInit:(UITableView *)tableView
{
    static NSString *reuseID = @"message";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell)
    {
        cell = [[self alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, Cell_Height)];
    }
    return cell;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //初始化所有子控件
        self.iconView = [[UIImageView alloc] init];
        
        self.nameLab = [[UILabel alloc] init];
        self.nameLab.font = [UIFont boldSystemFontOfSize:20.0f];
        
        self.timeLab = [[UILabel alloc] init];
        self.timeLab.font = [UIFont systemFontOfSize:10.0f];
        
        self.messageLab = [[UILabel alloc] init];
        self.messageLab.font = [UIFont systemFontOfSize:12.0f];
        
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.messageLab];
    }
    return self;
}

#pragma mark - 更新数据展示
- (void)setMessageFrameInfo:(MessageFrameInfo *)messageFrameInfo
{
    _messageFrameInfo = messageFrameInfo;
    MessageInfo *messageInfo = self.messageFrameInfo.messageInfo;
    
    //更新数据
    self.iconView.image  = [UIImage imageNamed:messageInfo.icon];
    self.nameLab.text    = messageInfo.name;
    self.timeLab.text    = messageInfo.time;
    self.messageLab.text = messageInfo.message;
    
    //更新frame
    self.iconView.frame   = self.messageFrameInfo.iconFrame;
    self.nameLab.frame    = self.messageFrameInfo.nameFrame;
    self.timeLab.frame    = self.messageFrameInfo.timeFrame;
    self.messageLab.frame = self.messageFrameInfo.messageFrame;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
