//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *contentLabel;
@end

@implementation HomeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
//        self.contentView.frame = CGRectMake(0, 0, 375,300);
        self.contentView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
            self.titleLabel;
        })];

        [self.contentView addSubview:({
            self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 300, 200)];
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
    frame.origin.x += 10;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

// 每个cell对应的数据来源
- (void)layoutTableViewCellWithItem:(NSDictionary *)item {
    self.contentView.backgroundColor = item[@"bgColor"];

    _titleLabel.text = item[@"title"];
    _contentLabel.text = item[@"content"];
}

@end