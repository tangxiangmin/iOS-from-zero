//
// Created by bcz on 2020/7/27.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "LolModel.h"
#import "HeroDetailView.h"

@interface HeroDetailViewController ()
@property(strong, nonatomic, readwrite) NSDictionary *chess;
@property(strong, nonatomic, readwrite) NSArray *races;
@property(strong, nonatomic, readwrite) NSArray *jobs;

@property(strong, nonatomic, readwrite) NSString *chessId;
@property(nonatomic, strong, readwrite) UIImageView *banner;
@property(nonatomic, strong, readwrite) UIView *skillView;

@end


@implementation HeroDetailViewController
- (instancetype)initWithData:(NSString *)id {
    self = [super init];
    if (self) {
        _chessId = id;
//        _data = data;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchHeroDetail];
}


- (void)fetchHeroDetail {
    __weak typeof(self) weakSelf = self;
    NSLog(_chessId);
    [LolModel fetchHeroDetail:_chessId success:^(NSDictionary *chess, NSArray *races, NSArray *jobs) {
        _chess = chess;
        _races = races;
        _jobs = jobs;

        // 在主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf renderPage];
        });
    }];
}

- (void)renderPage {
    HeroDetailView *page = [[HeroDetailView alloc] initWithFrame:self.view.bounds chess:_chess jobs:_jobs races:_races];

    [self.view addSubview:page];
}

@end