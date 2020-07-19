//
// Created by bcz on 2020/7/19.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end


@implementation RootViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}

@end