//
// Created by bcz on 2020/8/5.
// Copyright (c) 2020 shymean. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserModel : NSObject
@property(nonatomic, copy) NSString *token;
@property(nonatomic, copy) NSString *nickName;
@property(nonatomic, copy) NSString *avatar;
@property(nonatomic, copy) NSString *sign;

+ (UserModel *)currentUser; // 当前用户信息

+ (void)loginWithAccount:(NSString *)username password:(NSString *)password success:(void (^)(NSDictionary *))success;

+ (void)fetchUserInfo:(void (^)(UserModel *))success;

+ (NSString *)getAccessToken;
+ (NSDictionary *)getLoginInfo;
@end