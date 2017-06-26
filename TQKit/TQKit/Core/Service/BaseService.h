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

@end
