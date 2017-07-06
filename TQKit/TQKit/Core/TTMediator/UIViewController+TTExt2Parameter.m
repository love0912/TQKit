//
//  UIViewController+TTExt2Parameter.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "UIViewController+TTExt2Parameter.h"

#import <objc/runtime.h>

const NSString *kVCParameter;
@implementation UIViewController (TTExt2Parameter)

- (void)setTt_parameter:(NSDictionary *)tt_parameter {
    NSMutableDictionary *parameter = [NSMutableDictionary dictionaryWithDictionary:tt_parameter];
    objc_setAssociatedObject(self, &kVCParameter, parameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)tt_parameter {
    NSDictionary *parameter = objc_getAssociatedObject(self, &kVCParameter);
    return [NSMutableDictionary dictionaryWithDictionary:parameter];
}

@end
