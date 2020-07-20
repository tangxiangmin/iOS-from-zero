//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@end

@implementation HomeCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 200)];
            self.titleLabel.text = @"!23";
            self.titleLabel;
        })];
    }

    return self;

}

@end