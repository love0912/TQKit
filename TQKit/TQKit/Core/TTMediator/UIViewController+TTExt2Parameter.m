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
    objc_setAssociatedObject(self, &kVCParameter, tt_parameter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)tt_parameter {
    return objc_getAssociatedObject(self, &kVCParameter);
}

@end
