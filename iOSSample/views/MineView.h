//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Yoga.h"

@protocol MineViewDelegate<NSObject>
- (void)doClickLogin;
@end


@interface MineView : UIView
@property (nonatomic, weak) id<MineViewDelegate> delegate;
@end