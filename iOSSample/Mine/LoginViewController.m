//
// Created by bcz on 2020/7/19.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking.h>

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

// todo 统一管理网络请求
- (void)login {
    NSLog(@"login...");
    NSString *username = _username.text;
    NSString *password = _password.text;

    NSString *urlString = @"http://127.0.0.1:7654/api/auth/login";
//    NSString *urlString = @"https://static001.geekbang.org/univer/classes/ios_dev/lession/45/toutiao.json";

    NSURL *apiUrl = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:apiUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id res = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSDictionary *jsonObj = (NSDictionary *) res;
        NSString *token = ((NSDictionary *) jsonObj[@"data"])[@"token"];

        [strongSelf saveLoginInfo:username password:password token:token];

    }];

    [dataTask resume];
}

// 将登录信息保存到本地
- (void)saveLoginInfo:(NSString *)username password:(NSString *)password token:(NSString *)token {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:username forKey:@"username"];
    [userDefaults setObject:password forKey:@"password"];
    [userDefaults setObject:token forKey:@"token"];
}

// 从本地获取存储的信息
- (void)getLoginInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefaults objectForKey:@"username"];
    NSString *password = [userDefaults objectForKey:@"password"];
//    NSString *token = [userDefaults objectForKey:@"token"];

//    NSLog(token);
    _username.text = username;
    _password.text = password;
}

@end