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
        _httpAction = [TTHttpAction sharedHttpActionByApiReturnCodeSuccess:self.apiReturnCodeSuccess codeKey:self.apiReturnCodeKey dataKey:self.apiReturnDataKey msgKey:self.apiReturnMsgKey];
        _fileAction = [TTFileAction sharedFileAction];
    }
    return self;
}

- (NSInteger)apiReturnCodeSuccess {
    return [TTConstants sharedInstance].apiReturnCodeSuccess;
}

- (NSString *)apiReturnCodeKey {
    return [TTConstants sharedInstance].apiReturnCode;
}

- (NSString *)apiReturnDataKey {
    return [TTConstants sharedInstance].apiReturnData;
}

- (NSString *)apiReturnMsgKey {
    return [TTConstants sharedInstance].apiReturnMsg;
}
@end
