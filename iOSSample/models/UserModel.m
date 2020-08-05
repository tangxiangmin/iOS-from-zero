//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import "UserModel.h"
#import "HttpClient.h"


static UserModel *_currentUser;


@implementation UserModel
- (instancetype)initWithData:(NSString *)nickName avatar:(NSString *)avatar sign:(NSString *)sign {
    self = [super init];
    if (self) {
        _avatar = avatar;
        _nickName = nickName;
        _sign = sign;
    }

    return self;
}

+ (UserModel *)currentUser {
    return _currentUser;
}

+ (void)loginWithAccount:(NSString *)username password:(NSString *)password success:(void (^)(NSDictionary *))success {
    [HttpClient get:@"http://127.0.0.1:7654/api/auth/login" params:@{@"username": username, @"password": password} success:^(NSDictionary *data) {
        NSString *token = data[@"token"];

        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:username forKey:@"username"];
        [userDefaults setObject:password forKey:@"password"];
        [userDefaults setObject:token forKey:@"token"];
        success(data);
    }];

}

+ (void)fetchUserInfo:(void (^)(UserModel *))success {
    [HttpClient get:@"http://127.0.0.1:7654/api/user/userInfo" params:nil success:^(NSDictionary *data) {
        UserModel *user = [[UserModel alloc] initWithData:data[@"nickname"] avatar:data[@"avatar"] sign:data[@"sign"]];
        _currentUser = user;
        success(user);
    }];
}

+ (NSString *)getAccessToken {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *token = [userDefaults objectForKey:@"token"];
    return token;
}

+ (NSDictionary *)getLoginInfo {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefaults objectForKey:@"username"];
    NSString *password = [userDefaults objectForKey:@"password"];
    return @{@"username": username, @"password": password};
}


@end