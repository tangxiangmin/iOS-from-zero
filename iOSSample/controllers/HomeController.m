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
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];

        self.dataArray = @[
                @{@"title": @"title1", @"content": @"《JavaScript高级程序设计》（第三版）闭包中的this，“每个函数在被调用时都会自动取得两个特殊变量：this和arguments。内部函数在搜索这两个变量时，只会搜索到其活动对象为止，因此永远不可能直接访问外部函数中的这两个变量”这句话不理…",@"bgColor":[UIColor redColor]},
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
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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