//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroCell.h"

@interface HeroCell ()
@property(nonatomic, strong, readwrite) UIImageView *imageView;

@end

@implementation HeroCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];

    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addSubview:_imageView];

//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeroCell)];
//    [self addGestureRecognizer:tap];

    return self;
}

- (void)setImage:(NSString *)url {
    NSString *urlStr = [@"https://game.gtimg.cn/images/lol/act/img/tft/champions/" stringByAppendingString:url];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]]];
    _imageView.image = image;
}

- (void)clickHeroCell {
    NSLog(@"hello");

//    if (self.delegate && [self.delegate respondsToSelector:@selector(clickCell:)]) {
//        [self.delegate clickCell:_data];
//    }
}
@end