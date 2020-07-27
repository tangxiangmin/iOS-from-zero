//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()
@property(strong, nonatomic, readwrite) NSDictionary *data;

@end


@implementation HeroDetailViewController
- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {

        _data = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlStr = [@"https://game.gtimg.cn/images/lol/tft/cham-icons/624x318/" stringByAppendingString:_data[@"name"]];
    NSLog(urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];

    UIImageView *banner = [[UIImageView alloc] init];
    [banner setImage:image];
    [banner configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(375);
        layout.height = YGPointValue(191);
//            layout.marginRight = YGPointValue(10);
    }];


    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 375, 300)];
    label.numberOfLines = 10;
    label.text = _data[@"skillIntroduce"];


    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    [self.view addSubview:banner];
}
@end