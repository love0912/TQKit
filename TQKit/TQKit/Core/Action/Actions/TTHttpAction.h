//
//  TTHttpAction.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAPIClient.h"
#import "TTConstants.h"
#import "TT_Define_App.h"
@class BaseService;


/**
 *  HTTP访问回调
 *
 *  @param errCode 状态码 0 访问失败   200 正常  500 空 其他异常
 *  @param data    返回数据 nil 为空
 *  @param errMsg     错误描述
 */
typedef void(^ResultBlock)(NSInteger errCode, id data, NSString *errMsg);

/**
 1.1.4新增 -- 第三方接口获取的数据，不判断返回值，直接返回接口的数据

 @param data 接口返回的数据
 */
typedef void(^Result3rdBlock)(id data, NSError *error);

@interface TTHttpAction : NSObject

@property (nonatomic, strong) TTAPIClient *apiClient;

@property (nonatomic, weak) BaseService *service;


+ (instancetype)sharedHttpAction TTKitDeprecated("2.0过期提醒，使用sharedHttpActionWithService:方法，新增对每个接口Key值的控制");

+ (instancetype)sharedHttpActionWithService:(BaseService *)service;

- (BOOL)isReachable;

#pragma mark - 网络请求方法

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading..)
 *
 *  @param URLString    接口地址
 *  @param requestBlock 回调函数
 */
- (void)POSTHUDByUrlString:(NSString *)URLString result:(ResultBlock)requestBlock;


/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param requestBlock 回调函数
 */
- (void)POSTByUrlString:(NSString *)URLString result:(ResultBlock)requestBlock;

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading..)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)POSTHUDByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock;

/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)POSTByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock;

/**
 *  普通的访问请求(有提示，带判断网络状态, 带loading)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)GETHUDByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock;

/**
 *  普通的访问请求(有提示，带判断网络状态)
 *
 *  @param URLString    接口地址
 *  @param parameters   字典参数
 *  @param requestBlock 回调函数
 */
- (void)GETByUrlString:(NSString *)URLString parameters:(id)parameters result:(ResultBlock)requestBlock;

/**
 获取html代码

 @param URLString html连接
 @param requestBlock 回调函数
 */
- (void)getHtmlStringOfURLString:(NSString *)URLString result:(ResultBlock)requestBlock;


#pragma mark - 新增访问三方接口，直接返回所有返回值。

/**
 访问三方接口，直接返回所有返回值。不作Code判断，只做Http访问结果判断
 GET请求
 @param URLString 接口地址
 @param parameters 字典参数
 @param result 回调函数
 */
- (void)GET3rdByUrlString:(NSString *)URLString parameters:(id)parameters result:(Result3rdBlock)result;

/**
 访问三方接口，直接返回所有返回值。不作Code判断，只做Http访问结果判断
 POST请求
 @param URLString 接口地址
 @param parameters 字典参数
 @param result 回调函数
 */
- (void)POST3rdByUrlString:(NSString *)URLString parameters:(id)parameters result:(Result3rdBlock)result;

#pragma mark - 设置\获取Http Header 的值
/**
 设置Http Header参数值
 
 @param value value
 @param field key
 */
- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 获取Http header的值
 
 @param field key
 @return value
 */
- (NSString *)valueForHTTPHeaderField:(NSString *)field;

@end
