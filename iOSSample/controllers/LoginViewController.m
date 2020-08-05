//
// Created by bcz on 2020/7/19.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "LoginViewController.h"
#import "MineController.h"
#import "UserModel.h"

@interface LoginViewController () <UITextFieldDelegate>

@property(readwrite, strong, nonatomic) UILabel *logo;
@property(readwrite, strong, nonatomic) UITextField *username;
@property(readwrite, strong, nonatomic) UITextField *password;
@property(readwrite, strong, nonatomic) UIButton *submit;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"登录";

    self.view.backgroundColor = [UIColor whiteColor];
    _logo = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 315, 50)];
    _logo.text = @"登录";
    _logo.textAlignment = NSTextAlignmentCenter;
    _logo.font = [UIFont systemFontOfSize:40];

    _username = [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 315, 50)];
    _username.placeholder = @"请输入用户名";
    _username.borderStyle = UITextBorderStyleRoundedRect;

    _username.delegate = self;

    _password = [[UITextField alloc] initWithFrame:CGRectMake(30, 270, 315, 50)];
    _password.borderStyle = UITextBorderStyleRoundedRect;
    _password.placeholder = @"请输入密码";

    _submit = [[UIButton alloc] initWithFrame:CGRectMake(30, 340, 315, 50)];
    _submit.backgroundColor = [UIColor redColor];

    [_submit setTitle:@"确定" forState:UIControlStateNormal];
    [_submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    _submit.layer.masksToBounds = YES;
    _submit.layer.cornerRadius = 4;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(login)];
    [_submit addGestureRecognizer:tap];

    [self.view addSubview:_username];
    [self.view addSubview:_password];
    [self.view addSubview:_submit];
    [self.view addSubview:_logo];

    [self getLoginInfo];
}

// 提交登录
- (void)login {
    __weak typeof(self) weakSelf = self;
    [UserModel loginWithAccount:_username.text password:_password.text success:^(NSDictionary *data) {
        // 登录成功，返回个人中心
        [weakSelf.navigationController pushViewController:[[MineController alloc] init] animated:YES];
    }];
}

// 从本地获取存储的信息
- (void)getLoginInfo {
    NSDictionary *info = [UserModel getLoginInfo];
    _username.text = info[@"username"];
    _password.text = info[@"password"];
}

@end