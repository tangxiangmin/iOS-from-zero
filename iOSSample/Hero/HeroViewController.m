//
// Created by bcz on 2020/7/26.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroViewController.h"

@interface HeroViewController () <HeroCellDelegate>
@property(nonatomic, strong, readwrite) UIScrollView *page1;
@property(nonatomic, strong, readwrite) NSArray *heroList;
@end


@implementation HeroViewController
- (instancetype)init {
    self = [super init];

    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"英雄列表";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {

    UIScrollView *view = [[UIScrollView alloc] initWithFrame:self.view.bounds];

    [view addSubview:({
        // todo scrollView
        _page1 = [[UIScrollView alloc] initWithFrame:CGRectMake(view.bounds.size.width * 0, 0, view.bounds.size.width, view.bounds.size.height)];
        _page1;
    })];

    view.pagingEnabled = YES;
    view.contentSize = CGSizeMake(self.view.bounds.size.width * 1, self.view.bounds.size.height);

    [self.view addSubview:view];

    [self fetchHeroList];
}

- (UIView *)renderHeroList:(NSArray *)list {
    UIView *page = [[UIView alloc] init];

    [page configureLayoutWithBlock:^(YGLayout *layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(375);
        layout.height = YGPointValue(2000);
        layout.flexWrap = YGWrapWrap;
        layout.flexDirection = YGFlexDirectionRow;
        layout.paddingHorizontal = YGPointValue(5);
        layout.paddingVertical = YGPointValue(5);
    }];
    page.backgroundColor = [UIColor purpleColor];

    for (int i = 0; i < list.count; ++i) {
        NSDictionary *data = list[(NSUInteger) i];

        HeroCell *cell = [[HeroCell alloc] initWithData:data];
        cell.delegate = self;

        [page addSubview:cell];
    }
    [page.yoga applyLayoutPreservingOrigin:NO];

    [_page1 addSubview:page];
    return page;
}

- (void)fetchHeroList {
//    NSString *apiUrl = @"https://game.gtimg.cn/images/lol/act/img/tft/js/chess.js";
    NSString *apiUrl = @"http://127.0.0.1:7654/api/lol/heroList";

    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[[NSURL alloc] initWithString:apiUrl] completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id res = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSDictionary *jsonObj = (NSDictionary *) res;
        NSArray *list = (id) (NSDictionary *) jsonObj[@"data"];
        _heroList = list;

        // 在主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [strongSelf renderHeroList:list];
        });
    }];

    [dataTask resume];
}

- (void)clickCell:(NSDictionary *)data {
//    NSLog(@"click Cell");
//    NSLog(@"%@", data);

    [self.navigationController pushViewController:[[HeroDetailViewController alloc] initWithData:data] animated:YES];
}


@end