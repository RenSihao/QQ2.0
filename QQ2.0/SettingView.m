//
//  SettingView.m
//  QQ2.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "SettingView.h"
#import "Commond.h"

@interface SettingView ()

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SettingView

#pragma mark - 接口部分
+ (instancetype)settingViewInit
{
    SettingView *settingView = [[SettingView alloc] init];
    return settingView;
}
- (instancetype)init
{
    if(self = [super init])
    {
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:({
            CGRect frame =
            CGRectMake(0, HEADER_HEIGHT,[[UIScreen mainScreen] bounds].size.width,
                       [[UIScreen mainScreen] bounds].size.height-HEADER_HEIGHT-FOOTER_HEIGHT);
            frame;
        }) style:UITableViewStylePlain];
    }
    return _tableView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
