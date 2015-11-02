//
//  LeftMenu.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/27.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftMenuDelegate <NSObject>

-(void)leftMenuDidSeletedAtRow:(NSInteger)row title:(NSString *)title;
-(void)leftMenuSettingButtonIsClick;

@end



@interface LeftMenu : UIView

@property (nonatomic, strong) NSArray *list;
@property (nonatomic, weak) id<LeftMenuDelegate> delegate;
@end
