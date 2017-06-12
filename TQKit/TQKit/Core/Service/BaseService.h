//
//  BaseService.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTHttpAction.h"

@interface BaseService : NSObject

@property (nonatomic, strong) TTHttpAction *httpAction;

+ (instancetype)sharedService;

@end
