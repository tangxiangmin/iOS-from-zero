//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "MineController.h"
#import "LoginViewController.h"

@interface MineController ()

@end

@implementation MineController

- (instancetype)init {
    self = [super init];

    NSLog(@"mine 123213");
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 315, 50)];
    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 340, 315, 50)];
    loginBtn.backgroundColor = [UIColor redColor];

    [loginBtn setTitle:@"去登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];


    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toLogin)];
    [loginBtn addGestureRecognizer:tap];

    [self.view addSubview:loginBtn];
}

- (void)toLogin {
    [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:YES];
}
@end