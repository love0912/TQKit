//
//  NSString+TTExt2Hash.h
//  TQKit
//
//  Created by 天智慧启 on 2017/6/7.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TTExt2Hash)

/**
 Returns a lowercase NSString for md2 hash.
 */
- (nullable NSString *)tt_md2String;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (nullable NSString *)tt_md4String;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (nullable NSString *)tt_md5String;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (nullable NSString *)tt_sha1String;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (nullable NSString *)tt_sha224String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (nullable NSString *)tt_sha256String;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (nullable NSString *)tt_sha384String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (nullable NSString *)tt_sha512String;

/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacMD5StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacSHA224StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacSHA384StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (nullable NSString *)tt_hmacSHA512StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (nullable NSString *)tt_crc32String;

@end

NS_ASSUME_NONNULL_END
