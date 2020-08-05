//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//
#import "UIView+Yoga.h"

//@protocol HeroCellDelegate <NSObject>
//- (void)clickCell:(NSDictionary *)data;
//@end

@interface HeroCell : UICollectionViewCell

//@property(nonatomic, weak, readwrite) id <HeroCellDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;


- (void)setImage:(NSString *)url;
@end