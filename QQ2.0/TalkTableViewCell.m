//
//  TalkTableViewCell.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/6.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "TalkTableViewCell.h"
#import "TalkFrameInfo.h"
#import "TalkInfo.h"

@interface TalkTableViewCell ()

@property (nonatomic, strong) UILabel     *timeLab;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton    *textBtn;
@end

@implementation TalkTableViewCell

#pragma mark - 接口部分
+ (TalkTableViewCell *)talkTableViewCellInit:(UITableView *)tableView
{
    static NSString *reuseID = @"talk";
    TalkTableViewCell *cell = [[TalkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    if(!cell)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        
    }
    cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0f];;
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.timeLab = [[UILabel alloc] init];
        self.timeLab.textAlignment = NSTextAlignmentCenter;
        self.timeLab.font = [UIFont systemFontOfSize:10.0f];
        
        self.iconView = [[UIImageView alloc] init];
        self.iconView.layer.cornerRadius = 25;
        self.iconView.layer.masksToBounds = YES;
        
        self.textBtn = [[UIButton alloc] init];
        self.textBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.textBtn.titleLabel.numberOfLines = 0;
        self.textBtn.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        [self.textBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.textBtn];
    }
    return self;
}

#pragma mark - 更新数据源
- (void)setTalkFrameInfo:(TalkFrameInfo *)talkFrameInfo
{
    _talkFrameInfo = talkFrameInfo;
    TalkInfo *talkInfo = self.talkFrameInfo.talkInfo;
    
    //更新数据
    //time
    self.timeLab.text = talkInfo.time;
    
    //icon
    if(talkInfo.type == SenderSelf)
    {
        self.iconView.image = [UIImage imageNamed:@"qqstar1@2x"];
    }
    else if(talkInfo.type == SenderOther)
    {
        self.iconView.image = [UIImage imageNamed:@"qqstar2@2x"];
    }
    
    //text
    [self.textBtn setTitle:talkInfo.text forState:UIControlStateNormal];
    if(talkInfo.type == SenderSelf)
    {
        UIImage *press_img = [UIImage imageNamed:@"chat_send_press_pic@2x"];
        UIImage *normal_img = [UIImage imageNamed:@"chat_send_nor@2x"];
        [normal_img stretchableImageWithLeftCapWidth:normal_img.size.width/2-1 topCapHeight:normal_img.size.height/2-1];
        [self.textBtn setBackgroundImage:normal_img forState:UIControlStateNormal];
        [self.textBtn setBackgroundImage:press_img forState:UIControlStateSelected];
        
    }
    else if(talkInfo.type == SenderOther)
    {
        UIImage *press_img = [UIImage imageNamed:@"chat_recive_press_pic@2x"];
        UIImage *normal_img = [UIImage imageNamed:@"chat_recive_nor@2x"];
        [normal_img stretchableImageWithLeftCapWidth:normal_img.size.width/2-1 topCapHeight:normal_img.size.height/2-1];
        [self.textBtn setBackgroundImage:normal_img forState:UIControlStateNormal];
        [self.textBtn setBackgroundImage:press_img forState:UIControlStateSelected];
    }
    
    //更新frame
    self.timeLab.frame  = self.talkFrameInfo.timeFrame;
    self.iconView.frame = self.talkFrameInfo.iconFrame;
    self.textBtn.frame  = self.talkFrameInfo.textFrame;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
