//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import <YogaKit/UIView+Yoga.h>


@protocol HeroCellDelegate <NSObject>
- (void)clickCell:(NSDictionary *)data;
@end

@interface HeroCell : UIView

@property(nonatomic, weak, readwrite) id <HeroCellDelegate> delegate;

- (instancetype)initWithData:(NSDictionary *)data;
@end