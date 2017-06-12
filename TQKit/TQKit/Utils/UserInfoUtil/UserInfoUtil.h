//
//  UserInfoUtil.h
//  JKCommunity
//
//  Created by 郭界 on 2017/3/6.
//  Copyright © 2017年 ythd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Security/Security.h>
#define kUserName  @"com.tqSoft.username"

@interface UserInfoUtil : NSObject


/**
 存储用户密码到keyChain

 @param password 用户密码
 @param userId 对应服务器唯一的userid
 */
+ (void)setPassword:(NSString *)password forKeyChainUserID:(NSString *)userId;


/**
 从Keychain中取保存的密码

 @param userId 用户唯一的ID
 @return 返回用户密码
 */
+ (NSString *)getPasswordForKeychainUserId:(NSString *)userId;


/**
 通过ID删除keyChain中保存的对象

 @param ID keyChain中保存的ID
 */
+ (void)deleteObjForKeyChainByID:(NSString *)ID;


@end
