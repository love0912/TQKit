//
//  NSString+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TTExt)

#pragma mark - Utilities

/**
 返回UUID  eg:A72E2B8C-40DA-4BFD-BADB-9CD98013FE5E

 @return UUID
 */
+ (NSString *)tt_stringByUUID;

/**
 *  @brief  清除html标签
 *
 *  @return 清除后的结果
 */
- (NSString *)tt_stringByTrimmingHTMLLabel;

/**
 *  @brief  清除js脚本
 *
 *  @return 清楚js后的结果
 */
- (NSString *)tt_stringByTrimmingScriptsAndStrippingHTML;

/**
 *  @brief  去除字符串两端空格
 *
 *  @return 去除字符串两端的字符串
 */
- (NSString *)tt_stringByTrimmingWhitespace;

/**
 去除字符串中所有的空格

 @return 新的字符串
 */
- (NSString *)tt_stringByTrimmingAllWhitespace;

/**
 *  @brief  去除字符串两端空格与换行符
 *
 *  @return 去除字符串两端空格与换行符
 */
- (NSString *)tt_stringByTrimmingWhitespaceAndNewlines;

/**
 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
 */
- (BOOL)tt_isNotEmpty;

///**
// nil, @"", @"  ", @"\n" will Returns YES; otherwise Returns NO.
// */
//- (BOOL)tt_isEmpty;

/**
 获取拼音

 @return 字符串拼音
 */
- (NSString*)tt_pinYin;

/**
 *  获取拼音首字母
 *
 *  @return 获取拼音首字母
 */
- (NSString*)tt_initialOfPinyin;


/**
 *  将字符串转化为NSURL
 *
 *  @return  NSURL地址
 */
-(NSURL *)tt_toUrl;

/**
 *  将资源字符串转化为图片资源
 *
 *  @return  图片
 */
-(UIImage *)tt_toImage;

- (NSNumber *)tt_numberValue;

#pragma mark - Encode and decode
///=============================================================================
/// @name Encode and decode
///=============================================================================

/**
 *  字符串加密为base64
 *
 *  @return 返回String
 */
- (nullable NSString *)tt_base64EncodedString;

/**
 *  解密base64字符串
 *
 *  @return 返回解析后的字符串
 */
- (nullable NSString *)tt_stringFromBase64EncodedString;

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)tt_tringByURLEncode;

/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)tt_stringByURLDecode;

/**
 Escape commmon HTML to Entity.
 Example: "a < b" will be escape to "a&lt;b".
 */
- (NSString *)tt_stringByEscapingHTML;

/**
 格式化电话号码显示

 @return fg. 133 3333 3333
 */
- (NSString *)tt_formatToPhoneNumber;

/**
 格式化银行卡显示

 @return fg. xxxx xxxx xxxx xxx
 */
- (NSString *)tt_formatToCardNumber;


@end

NS_ASSUME_NONNULL_END
