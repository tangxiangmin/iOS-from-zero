//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LolModel : NSObject
+ (void)fetchHeroList:(void (^)(NSArray *))success;

+ (void)fetchHeroDetail:(NSString *)chessId success:(void (^)(NSDictionary *chess, NSArray<NSDictionary *> *races, NSArray<NSDictionary *> *jobs))success;

@end