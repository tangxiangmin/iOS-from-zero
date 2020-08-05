//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

// 封装AFNetworking，

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    HttpResponseType_Common,
    HttpResponseType_Json,
    HttpResponseType_XML
} HttpResponseType;


@interface HttpClient : NSObject
+ (instancetype)instance;
//+ (instancetype)instance;


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *))successHandler failure:(void (^)(NSError *))failure;
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *))successHandler;


- (void)request:(NSString *)url method:(NSString *)method params:(NSDictionary *)params success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure;

@end