//
//  TT_Define_App.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#ifndef TT_Define_App_h
#define TT_Define_App_h

/*****
 *  日志打印
 *  发布版不打印 开发版打印
 ******/
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define ScreenFrame [UIScreen mainScreen].bounds
#define ScreenSize [UIScreen mainScreen].bounds.size

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

/**
 沙盒取值
 
 @param key 根据key取value
 */
#define TT_UserDefault_Get(key) ([[NSUserDefaults standardUserDefaults] valueForKey:key])
#define TT_UserDefault_Set(key, value) ([[NSUserDefaults standardUserDefaults] setObject:value forKey:key])

/**
 weakself,weak
 */
#define WEAKSELF __weak typeof(self) weakSelf = self;
#define WEAK(weaks,s)  __weak __typeof(&*s)weaks = s;

/**
 设置过期提醒
 */
#define TTKitDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)


#endif /* TT_Define_App_h */
