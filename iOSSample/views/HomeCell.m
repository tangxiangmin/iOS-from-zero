//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *subTitleLabel;
@property(nonatomic, strong, readwrite) UILabel *contentLabel;

@property(nonatomic, strong, readwrite) UIView *headView;
@property(nonatomic, strong, readwrite) UIImageView *avatarImage;

@end

@implementation HomeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self.contentView addSubview:({
            self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 42)];
            self.headView;
        })];

        [self.headView addSubview:({
            self.avatarImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 42, 42)];
            NSURL *url = [NSURL URLWithString:@"https://avatars3.githubusercontent.com/u/17941407"];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            [self.avatarImage setImage:image];

            self.avatarImage.layer.masksToBounds = YES;
            self.avatarImage.layer.cornerRadius = 21;

            self.avatarImage;
        })];

        [self.headView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 0, 200, 20)];
            self.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightBold];
            self.titleLabel;
        })];

        [self.headView addSubview:({
            self.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(52, 23, 200, 20)];
            self.subTitleLabel.text = @"UI设计师... . 37分钟前";
            self.subTitleLabel.font = [UIFont systemFontOfSize:12];
            self.subTitleLabel;
        })];

        [self.contentView addSubview:({
            self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 340, 100)];
            self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
            self.contentLabel.numberOfLines = 8;
            self.contentLabel.font = [UIFont systemFontOfSize:14];
//            [self.contentLabel sizeToFit];

            self.contentLabel;
        })];
    }

    return self;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

// 设置每个cell的边距
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 12.5;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 25;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

// 每个cell对应的数据来源
- (void)layoutTableViewCellWithItem:(NSDictionary *)item {
//    self.contentView.backgroundColor = item[@"bgColor"];

    _titleLabel.text = item[@"title"];
    _contentLabel.text = item[@"content"];
}

@end