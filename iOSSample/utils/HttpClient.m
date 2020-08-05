//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "HttpClient.h"
#import "UserModel.h"

#define kTimeOutInterval 30 // 请求超时的时间


@interface HttpClient ()
@property AFHTTPSessionManager *manager;

@end

@implementation HttpClient
- (instancetype)init {
    self = [super init];

    _manager = [AFHTTPSessionManager manager];
    // 超时时间
    _manager.requestSerializer.timeoutInterval = kTimeOutInterval;

    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    _manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式

    // 声明获取到的数据格式
    _manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析

    return self;
}

+ (instancetype)instance {

    static HttpClient *client;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        client = [[HttpClient alloc] init];
    });
    return client;
}


// get 请求
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *))successHandler failure:(void (^)(NSError *))failure {
    [[self instance] request:url method:@"GET" params:params
                     success:^(NSDictionary *data) {
                         successHandler(data);
                     }
                     failure:failure];
}

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSDictionary *))successHandler {
    [self get:url params:params success:successHandler failure:nil];
}

- (void)request:(NSString *)url method:(NSString *)method params:(NSDictionary *)params success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {

    NSString *token = [UserModel getAccessToken];
    if (token == nil) {
        token = @"";
    }

    // 创建请求类
    NSDictionary *header = @{@"Authorization": token};
    NSURLSessionDataTask *task = [_manager dataTaskWithHTTPMethod:method URLString:url parameters:params headers:header uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask *task, id _Nullable responseObject) {
        NSDictionary *dict = (NSDictionary *) responseObject;
        NSNumber *code = dict[@"code"];
        NSString *message = dict[@"msg"];
        NSDictionary *data = dict[@"data"];
        success(data);
    }                                                     failure:^(NSURLSessionTask *task, NSError *error) {
        NSLog(@"%@", error);
        failure(error);
    }];
    [task resume];
}

@end