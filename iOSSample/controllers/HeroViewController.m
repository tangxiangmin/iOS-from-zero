//
// Created by bcz on 2020/7/26.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HeroViewController.h"
#import "LolModel.h"

@interface HeroViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, strong, readwrite) NSArray *heroList;
@property(nonatomic, strong, readwrite) UICollectionView *collectionView;
@end


@implementation HeroViewController
- (instancetype)init {
    self = [super init];

    _heroList = @[];

    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.title = @"英雄列表";
    self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home@2x.png"];
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;

    flowLayout.itemSize = CGSizeMake(64, 64);

    _collectionView.dataSource = self;
    _collectionView.delegate = self;

    _collectionView.backgroundColor = [UIColor whiteColor];

    [_collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];

    [self.view addSubview:_collectionView];

    [self fetchHeroList];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _heroList.count;
//    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];

    NSUInteger lastIndex = [indexPath indexAtPosition:[indexPath length] - 1];
    NSDictionary *data = _heroList[lastIndex];

    [cell setImage:data[@"name"]];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger lastIndex = [indexPath indexAtPosition:[indexPath length] - 1];
    NSDictionary *data = _heroList[lastIndex];
    [self.navigationController pushViewController:[[HeroDetailViewController alloc] initWithData:data[@"TFTID"]] animated:YES];
}

// 获取棋子列表
- (void)fetchHeroList {
    [LolModel fetchHeroList:^(NSArray *list) {
        _heroList = list;
        dispatch_async(dispatch_get_main_queue(), ^{
            [_collectionView reloadData];
        });
    }];
}

@end