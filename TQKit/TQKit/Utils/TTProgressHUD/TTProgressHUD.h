//
//  TTProgressHUD.h
//  TTLightKitDemo
//
//  Created by 天智慧启 on 2017/5/17.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
//默认取消时间
#define TTProgressDismissSeconds 2

@interface TTProgressHUD : NSObject

/**
 信息提示
 
 @param tips 信息
 */
+ (void)showInfoTips:(NSString *)tips;

/**
 信息提示
 
 @param tips 提示信息
 @param delay 延迟时间
 */
+ (void)showInfoTips:(NSString *)tips delay:(float)delay;

/**
 成功提示, 默认2秒取消

 @param tips 提示语
 */
+ (void)showSuccessTips:(NSString *)tips;

/**
 成功提示

 @param tips 提示语
 @param delay 延迟几秒取消
 */
+ (void)showSuccessTips:(NSString *)tips withDismissDelay:(float)delay;

/**
 错误提示,默认2秒取消

 @param tips 提示语
 */
+ (void)showErrorTips:(NSString *)tips;

/**
 错误提示
 
 @param tips 提示语
 @param delay 延迟几秒取消
 */
+ (void)showErrorTips:(NSString *)tips withDismissDelay:(float)delay;

/**
 等待提示框,转圆圈,无提示语
 */
+ (void)showFlatLoading;

/**
 等待提示框,转圆圈

 @param tips 提示语
 */
+ (void)showFlatLoadingWithTips:(NSString *)tips;

/**
 等待框,iOS 菊花转, 无提示语
 
 */
+ (void)showNativeLoading;

/**
 等待框,iOS 菊花转

 @param tips 提示语
 */
+ (void)showNativeLoadingWithTips:(NSString *)tips;

/**
 取消提示框
 */
+ (void)hideProgressHUD;

@end
