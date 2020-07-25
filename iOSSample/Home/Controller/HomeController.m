//
// Created by bcz on 2020/7/20.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HomeController.h"
#import "HomeCell.h"

@interface HomeController () <UITableViewDataSource, UITableViewDelegate, HomeCellDelegate>
@property(nonatomic, strong, readwrite) NSArray *dataArray;
@property(nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation HomeController
- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];

        self.dataArray = @[
                @{@"title": @"title1", @"content": @"content1",@"bgColor":[UIColor redColor]},
                @{@"title": @"title2", @"content": @"content2",@"bgColor":[UIColor blueColor]},
        ];
    }

    return self;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:self.dataArray[(NSUInteger) indexPath.row]];

    return cell;
}


@end