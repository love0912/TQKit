//
//  TTHttpAction.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAPIClient.h"
#import "TT_Define_Singleton.h"


#define APIReturnCode @""
#define APIReturnData @""
#define APIReturnCodeSuccess 200
/**
 *  HTTP访问回调
 *
 *  @param errCode 状态码 0 访问失败   200 正常  500 空 其他异常
 *  @param data    返回数据 nil 为空
 *  @param errMsg     错误描述
 */
typedef void(^ResultBlock)(NSInteger errCode, NSObject *data, NSError *errMsg);

@interface TTHttpAction : NSObject

+ (instancetype)sharedHttpAction;

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
@end
