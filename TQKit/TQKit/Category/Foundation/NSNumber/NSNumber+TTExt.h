//
//  NSNumber+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (TTExt)

+ (NSNumber *)tt_numberWithString:(NSString *)string;

#pragma mark - util

/* 展示 */

/**
 浮点数截取小数点后几位，四舍五入

 @param digit 小数点后尾数
 @return 截取后的string
 */
- (NSString*)tt_toDisplayNumberWithDigit:(NSInteger)digit;


/**
 *  @brief  四舍五入
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber *)tt_numberRoundByDigit:(NSUInteger)digit;

/**
 *  @brief  取上整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)tt_numberCeilByDigit:(NSUInteger)digit;

/**
 *  @brief  取下整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)tt_numberFloorByDigit:(NSUInteger)digit;

@end

NS_ASSUME_NONNULL_END
