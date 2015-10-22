//
//  LoginView.h
//  QQ2.0
//
//  Created by RenSihao on 15/10/7.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@protocol LoginViewDelegate <NSObject>

@optional
- (void)loginBtnDidClick:(LoginView *)loginView ;
@end

@interface LoginView : UIView

@property (nonatomic, weak) id<LoginViewDelegate> delegate;
+ (LoginView *)loginViewInit;
@end
