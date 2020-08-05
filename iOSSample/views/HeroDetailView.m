//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroDetailView.h"

@interface HeroDetailView () {
//    NSDictionary *chess;
//    NSArray *jobs;
//    NSArray *races;
}
@end


@implementation HeroDetailView
- (instancetype)initWithFrame:(CGRect)frame chess:(NSDictionary *)chess jobs:(NSArray *)jobs races:(NSArray *)races {
    self = [super initWithFrame:frame];

    self.backgroundColor = [UIColor whiteColor];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    UIView *page = [[UIView alloc] initWithFrame:self.bounds];


    [page addSubview:[self renderBanner:chess]];
    [page addSubview:[self renderHead:chess]];

    for (NSDictionary *job in jobs) {
        NSString *name = [NSString stringWithFormat:@"职业-%@", job[@"name"]];
        [page addSubview:[self renderContent:name content:job[@"introduce"] level:job[@"level"]]];
    }

    for (NSDictionary *race in races) {
        NSString *name = [NSString stringWithFormat:@"种族-%@", race[@"name"]];
        [page addSubview:[self renderContent:name content:race[@"introduce"] level:race[@"level"]]];
    }


    CGFloat scrollViewHeight = 42.0f;
    for (UIView *view in page.subviews) {
//        NSLog(@"%f", view.frame.size.height);
        scrollViewHeight += view.yoga.height.value;
    }

    scrollView.contentSize = CGSizeMake(self.bounds.size.width, scrollViewHeight);


    [page configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;
        layout.width = YGPointValue(375);
        layout.height = YGPointValue(scrollViewHeight);
        layout.marginBottom = YGPointValue(0);
    }];
    [page.yoga applyLayoutPreservingOrigin:NO];

    [scrollView addSubview:page];

    [self addSubview:scrollView];

    return self;
}


- (UIView *)renderBanner:(NSDictionary *)chess {
    NSString *urlStr = [@"https://game.gtimg.cn/images/lol/tft/cham-icons/624x318/" stringByAppendingString:chess[@"name"]];
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    UIImageView *_banner = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 191)];

    _banner.contentMode = UIViewContentModeScaleAspectFit;
    [_banner setImage:image];
    [_banner configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(375);
        layout.height = YGPointValue(_banner.frame.size.height);
    }];
    return _banner;
}

- (UIView *)renderHead:(NSDictionary *)chess {
    // 技能描述
    UIView *_skillView = [[UIView alloc] init];

    UIImage *skillImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:chess[@"skillImage"]]]];
    UIImageView *skillImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    [skillImageView setImage:skillImage];

    UILabel *skillName = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 100, 20)];
    skillName.font = [UIFont systemFontOfSize:16];
    skillName.text = chess[@"skillName"];

    UILabel *skillType = [[UILabel alloc] initWithFrame:CGRectMake(55, 20, 100, 20)];
    skillType.font = [UIFont systemFontOfSize:12];
    skillType.text = chess[@"skillType"];

    UILabel *skillMagic = [[UILabel alloc] initWithFrame:CGRectMake(275, 10, 100, 20)];
    skillMagic.font = [UIFont systemFontOfSize:16];
    skillMagic.text = [NSString stringWithFormat:@"%@ / %@", chess[@"startMagic"], chess[@"magic"]];

    // 自动计算内容文本高度..居然要写这么多代码
    UILabel *skillContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, 355, 0)];
    skillContent.font = [UIFont systemFontOfSize:14];
    skillContent.numberOfLines = 0;
    skillContent.text = chess[@"skillIntroduce"];
    [skillContent sizeToFit];

    [_skillView addSubview:skillImageView];
    [_skillView addSubview:skillName];
    [_skillView addSubview:skillType];
    [_skillView addSubview:skillMagic];
    [_skillView addSubview:skillContent];

    NSLog(@"%f", skillContent.frame.size.height);
    [_skillView configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(355);
        layout.marginTop = YGPointValue(10);
        layout.marginHorizontal = YGPointValue(10);
        layout.height = YGPointValue(55 + skillContent.frame.size.height);
    }];

    return _skillView;
}

- (UIView *)renderContent:(NSString *)title content:(NSString *)content level:(NSDictionary *)level {
    UIView *view = [[UIView alloc] init];

    UILabel *_title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    _title.font = [UIFont systemFontOfSize:18];
    _title.text = title;
    _title.numberOfLines = 0;
    [_title sizeToFit];


    UILabel *_content = [[UILabel alloc] initWithFrame:CGRectMake(0, _title.frame.size.height + 5, 355, 20)];
    _content.font = [UIFont systemFontOfSize:16];
    _content.numberOfLines = 0;
    _content.text = content;
    _content.font = [UIFont systemFontOfSize:14];
    [_content sizeToFit];

    CGFloat offset = _title.frame.size.height + _content.frame.size.height + 10;

    for (NSString *key in level) {
        UILabel *no = [[UILabel alloc] initWithFrame:CGRectMake(0, offset, 20, 20)];
        no.backgroundColor = [UIColor blackColor];
        no.textColor = [UIColor whiteColor];
        no.font = [UIFont systemFontOfSize:14];
        no.textAlignment = NSTextAlignmentCenter;
        no.text = key;

        UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(30, offset, 315, 20)];
        desc.text = level[key];
        desc.font = [UIFont systemFontOfSize:14];

        desc.numberOfLines = 0;
        [desc sizeToFit];

        [view addSubview:no];
        [view addSubview:desc];

        offset += desc.frame.size.height + 5;
    }

    [view addSubview:_title];
    [view addSubview:_content];

    [view configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(355);
        layout.marginTop = YGPointValue(10);
        layout.marginHorizontal = YGPointValue(10);
        layout.height = YGPointValue(offset);
    }];

    return view;
}
@end