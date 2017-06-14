//
//  NSString+TTExt2Hash.m
//  TQKit
//
//  Created by 天智慧启 on 2017/6/7.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "NSString+TTExt2Hash.h"
#import "NSData+TTExt.h"

@implementation NSString (TTExt2Hash)

- (NSString *)tt_md2String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_md2String];
}

- (NSString *)tt_md4String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_md4String];
}

- (NSString *)tt_md5String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_md5String];
}

- (NSString *)tt_sha1String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_sha1String];
}

- (NSString *)tt_sha224String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_sha224String];
}

- (NSString *)tt_sha256String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_sha256String];
}

- (NSString *)tt_sha384String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_sha384String];
}

- (NSString *)tt_sha512String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_sha512String];
}

- (NSString *)tt_crc32String {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] tt_crc32String];
}

- (NSString *)tt_hmacMD5StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacMD5StringWithKey:key];
}

- (NSString *)tt_hmacSHA1StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacSHA1StringWithKey:key];
}

- (NSString *)tt_hmacSHA224StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacSHA224StringWithKey:key];
}

- (NSString *)tt_hmacSHA256StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacSHA256StringWithKey:key];
}

- (NSString *)tt_hmacSHA384StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacSHA384StringWithKey:key];
}

- (NSString *)tt_hmacSHA512StringWithKey:(NSString *)key {
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            tt_hmacSHA512StringWithKey:key];
}
@end
