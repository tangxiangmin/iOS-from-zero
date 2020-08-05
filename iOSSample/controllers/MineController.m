//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "MineController.h"
#import "LoginViewController.h"
#import "MineView.h"

@interface MineController () <MineViewDelegate>

@end

@implementation MineController

- (instancetype)init {
    self = [super init];

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

    [self.view addSubview:[[MineView alloc] initWithFrame:CGRectMake(0, 64, 375, 667)]];
}


- (void)doClickLogin {
    [self.navigationController pushViewController:[[LoginViewController alloc] init] animated:NO];
}
@end