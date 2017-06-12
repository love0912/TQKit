//
//  NSDictionary+TTExt2UrlParam.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (TTExt2UrlParam)

/**
 *  @brief  将NSDictionary转换成url 参数字符串
 *
 *  @return url 参数字符串
 */
- (NSString *)tt_urlParamString;

@end

@interface NSString (TTExt2UrlParam)

/**
 *  将url参数转换成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)tt_toParamDictionary;

@end

NS_ASSUME_NONNULL_END
