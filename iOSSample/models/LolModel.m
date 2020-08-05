//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "LolModel.h"
#import "HttpClient.h"

@implementation LolModel
+ (void)fetchHeroList:(void (^)(NSArray *))success {
    [HttpClient get:@"http://127.0.0.1:7654/api/lol/heroList" params:nil success:^(NSDictionary *data) {
        NSArray *list = (id) data;
        success(list);
    }];
}

+ (void)fetchHeroDetail:(NSString *)chessId success:(void (^)(NSDictionary *chess, NSArray<NSDictionary *> *races, NSArray<NSDictionary *> *jobs))success {
    [HttpClient get:@"http://127.0.0.1:7654/api/lol/heroDetail" params:@{@"id": chessId} success:^(NSDictionary *data) {
        NSDictionary *chess = data[@"chess"];
        NSArray<NSDictionary *> *races = data[@"races"];
        NSArray<NSDictionary *> *jobs = data[@"jobs"];
        success(chess, races, jobs);
    }];

}
@end