//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroCell.h"

@interface HeroCell ()
@property(strong, nonatomic, readwrite) NSDictionary *data;
@end

@implementation HeroCell

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _data = data;
        [self renderCell];

//        return (HeroCell *) [self renderCell]; // 直接返回cell
    }
    return self;
}

- (UIView *)renderCell {
    self.backgroundColor = [UIColor yellowColor];

    NSString *urlStr = [@"https://game.gtimg.cn/images/lol/act/img/tft/champions/" stringByAppendingString:_data[@"name"]];

    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];

    UIImageView *avatar = [[UIImageView alloc] init];
    [avatar setImage:image];
    [avatar configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(63);
        layout.height = YGPointValue(63);
//            layout.marginRight = YGPointValue(10);
    }];

    [self addSubview:avatar];
    [self configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(63);
        layout.height = YGPointValue(63);
        layout.marginHorizontal = YGPointValue(5);
        layout.marginVertical = YGPointValue(5);
    }];

    // todo 这里能实现事件委托吗？
//    [cell addTarget:self action:@selector(clickHeroCell) forControlEvents:UIControlEventTouchUpInside];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeroCell)];
    [self addGestureRecognizer:tap];
    return self;
}

- (void)clickHeroCell {

    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCell:)]) {
        [self.delegate clickCell:_data];
    }
}
@end