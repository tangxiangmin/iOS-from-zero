//
//  ViewController.m
//  iOSSample
//
//  Created by bcz on 2020/7/19.
//  Copyright © 2020 shymean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView)];

    [view addGestureRecognizer:tap];
}

- (void)clickView{
    NSLog(@"123");
}


@end
