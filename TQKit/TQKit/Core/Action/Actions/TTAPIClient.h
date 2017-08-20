//
//  TTAPIClient.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>
#import "TT_Reachability.h"

@interface TTAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;


@property (nonatomic, assign, readonly) BOOL isReachable;


/**
 是否监控网络
 */
@property (nonatomic, assign) BOOL isDetectNetwork;


/**
 当前网络状态
    NotReachable = 0,  //无网络
	ReachableViaWiFi,  //WIFI
	ReachableViaWWAN   // 手机网络
 */
@property (nonatomic, assign) TTNetworkStatus netWorkStatus;

@end
