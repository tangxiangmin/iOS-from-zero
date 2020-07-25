//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HomeCellDelegate <NSObject>
//- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end

@interface HomeCell : UITableViewCell
@property(nonatomic, weak, readwrite) id <HomeCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(NSDictionary *)item;
@end