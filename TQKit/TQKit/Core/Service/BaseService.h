//
//  BaseService.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTHttpAction.h"
#import "TTFileAction.h"

@interface BaseService : NSObject

/**
 网络请求Action
 */
@property (nonatomic, strong) TTHttpAction *httpAction;

/**
 文件上传，下载Action。
 */
@property (nonatomic, strong) TTFileAction *fileAction;



+ (instancetype)sharedService;

/**
 API 请求成功返回的状态值
 */
@property (nonatomic, assign) NSInteger apiReturnCodeSuccess;

/**
 API 请求成功返回的状态值Key值
 */
@property (nonatomic, strong) NSString *apiReturnCodeKey;

/**
 API 请求返回的数据Key
 */
@property (nonatomic, strong) NSString *apiReturnDataKey;

/**
 API 请求返回的提示信息KEY
 */
@property (nonatomic, strong) NSString *apiReturnMsgKey;

@end
