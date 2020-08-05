//
// Created by bcz on 2020/8/4.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "Demo1.h"


@interface Demo1 ()

@end

@implementation Demo1

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    UIView *media = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 375, 150)];
    media.backgroundColor = [UIColor grayColor];

    NSString *urlStr = [@"https://game.gtimg.cn/images/lol/act/img/tft/champions/" stringByAppendingString:@"128.png"];

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]]];

    UIImageView *side = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 100, 100)];
    side.image = image;

    side.backgroundColor = [UIColor yellowColor];
    side.layer.masksToBounds = YES;
    side.layer.cornerRadius = 50;
    [media addSubview:side];

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(120, 25, 250, 20)];
    title.text = @"标题标题标题标题四标题标题标题标题四标题标题标题标题四标题标题标题标题四";
    title.font = [UIFont systemFontOfSize:20];
    title.numberOfLines = 0;
//    title.backgroundColor = [UIColor redColor];
    [title sizeToFit];

    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 250, 20)];
    content.text = @"内容内容内容内容内容内容内容内容内容内容内容内容";
    content.font = [UIFont systemFontOfSize:14];
    content.numberOfLines = 0;
    [content sizeToFit];
    content.frame = CGRectMake(120, title.frame.origin.y + title.frame.size.height + 5, 250, content.frame.size.height);

    [media addSubview:title];
    [media addSubview:content];

    [self.view addSubview:media];

    [self httpTest];
}

- (void)httpTest {

}
@end
