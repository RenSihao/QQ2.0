//
//  LoginView.m
//  QQ2.0
//
//  Created by RenSihao on 15/10/7.
//  Copyright © 2015年 RenSihao. All rights reserved.
//

#import "LoginView.h"
#import "MBProgressHUD+MJ.h"
#define MARGIN 5
#define ICON_WIDTH 75
#define ICON_HEIGHT 75
#define TF_HEIGHT 40
#define LOGIN_BTN_HEIGHT 40
#define FUNCTION_BTN_WIDTH 70
#define FUNCTION_BTN_HEIGHT 20

@interface LoginView () <LoginViewDelegate>

@property (nonatomic, strong) UIImageView *backView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITextField *accountTF;
@property (nonatomic, strong) UITextField *codeTF;
@property (nonatomic, strong) UIButton    *loginBtn;
@property (nonatomic, strong) UIButton    *canNotLoginBtn;
@property (nonatomic, strong) UIButton    *registerBtn;
@end

@implementation LoginView

#pragma mark - 接口部分
+ (LoginView *)loginViewInit
{
    LoginView *loginView = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    return loginView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.backView];
        [self addSubview:self.iconView];
        [self addSubview:self.accountTF];
        [self addSubview:self.codeTF];
        [self addSubview:self.codeTF];
        [self addSubview:self.loginBtn];
        [self addSubview:self.canNotLoginBtn];
        [self addSubview:self.registerBtn];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changgeLoginBtn) name:UITextFieldTextDidChangeNotification object:self.accountTF];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changgeLoginBtn) name:UITextFieldTextDidChangeNotification object:self.codeTF];
    }
    return self;
}

#pragma mark - 懒加载
- (UIImageView *)backView
{
    if(!_backView)
    {
        _backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _backView.image = [UIImage imageNamed:@"login_bg.jpg"];
    }
    return _backView;
}
- (UIImageView *)iconView
{
    if(!_iconView)
    {
        _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ICON_WIDTH, ICON_HEIGHT)];
        _iconView.center = CGPointMake([[UIScreen mainScreen] bounds].size.width / 2,
                                       [[UIScreen mainScreen] bounds].size.height / 5);
        
        _iconView.image = [UIImage imageNamed:@"login_avatar_default@2x.png"];
    }
    return _iconView;
}
- (UITextField *)accountTF
{
    if(!_accountTF)
    {
        _accountTF = [[UITextField alloc] initWithFrame:CGRectMake(0, MARGIN+CGRectGetMaxY(self.iconView.frame), [[UIScreen mainScreen] bounds].size.width, TF_HEIGHT)];
        
        _accountTF.placeholder        = @"QQ号/手机号/邮箱";
        _accountTF.textAlignment      = NSTextAlignmentCenter;
        _accountTF.keyboardType       = UIKeyboardTypeNumberPad;
        _accountTF.borderStyle        = UITextBorderStyleRoundedRect;
        _accountTF.clearButtonMode    = UITextFieldViewModeWhileEditing;
        _accountTF.autocorrectionType = NO;
        _accountTF.rightView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_textfield_more@2x"]];
        _accountTF.rightViewMode = UITextFieldViewModeAlways;
    }
    return _accountTF;
}
- (UITextField *)codeTF
{
    if(!_codeTF)
    {
        _codeTF = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.accountTF.frame), [[UIScreen mainScreen] bounds].size.width, TF_HEIGHT)];
        
        _codeTF.placeholder        = @"密码";
        _codeTF.textAlignment      = NSTextAlignmentCenter;
        _codeTF.keyboardType       = UIKeyboardTypeASCIICapable;
        _codeTF.returnKeyType      = UIReturnKeyJoin;
        _codeTF.borderStyle        = UITextBorderStyleRoundedRect;
        _codeTF.secureTextEntry    = YES;
        _codeTF.clearButtonMode    = UITextFieldViewModeWhileEditing;
        _codeTF.autocorrectionType = NO;
        
    }
    return _codeTF;
}

- (UIButton *)loginBtn
{
    if(!_loginBtn)
    {
        _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, MARGIN + CGRectGetMaxY(self.codeTF.frame), [[UIScreen mainScreen] bounds].size.width - 2 * MARGIN, LOGIN_BTN_HEIGHT)];
        
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_blue_nor@2x.png"] forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_blue_press@2x.png"] forState:UIControlStateSelected];
        [_loginBtn setEnabled:NO];
        [_loginBtn addTarget:self action:@selector(loginBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}
- (UIButton *)canNotLoginBtn
{
    if(!_canNotLoginBtn)
    {
        _canNotLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*MARGIN, [[UIScreen mainScreen] bounds].size.height-FUNCTION_BTN_HEIGHT-2*MARGIN, FUNCTION_BTN_WIDTH, FUNCTION_BTN_HEIGHT)];
        
        [_canNotLoginBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_canNotLoginBtn setTitle:@"无法登录?" forState:UIControlStateNormal];
        [_canNotLoginBtn setTitleColor:[UIColor colorWithRed:0 green:170/255.0f blue:234/255.0f alpha:1.0f] forState:UIControlStateNormal];
    }
    return _canNotLoginBtn;
}
- (UIButton *)registerBtn
{
    if(!_registerBtn)
    {
        _registerBtn = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-FUNCTION_BTN_WIDTH, self.canNotLoginBtn.frame.origin.y, FUNCTION_BTN_WIDTH, FUNCTION_BTN_HEIGHT)];
        
        [_registerBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_registerBtn setTitle:@"新用户" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:[UIColor colorWithRed:0 green:170/255.0f blue:234/255.0f alpha:1.0f] forState:UIControlStateNormal];
    }
    return _registerBtn;
}

#pragma mark - 响应方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.accountTF resignFirstResponder];
    [self.codeTF resignFirstResponder];
}
- (void)changgeLoginBtn
{
    if(self.accountTF.text.length && self.codeTF.text.length)
    {
        self.loginBtn.enabled = YES;
    }
    
}
#pragma mark - LoginViewDelegate
- (void)loginBtnDidClick:(LoginView *)loginView
{
    [MBProgressHUD showMessage:@"正在登录中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)2*NSEC_PER_SEC), dispatch_get_main_queue(),^(void){
        
        [MBProgressHUD hideHUD];
        if([self.delegate respondsToSelector:@selector(loginBtnDidClick:)])
        {
            [self.delegate loginBtnDidClick:loginView];
        }
    });
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
