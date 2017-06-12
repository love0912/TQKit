//
//  BaseService.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

#pragma mark - life cycle

+(instancetype)sharedService {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _httpAction = [TTHttpAction sharedHttpAction];
    }
    return self;
}

@end
