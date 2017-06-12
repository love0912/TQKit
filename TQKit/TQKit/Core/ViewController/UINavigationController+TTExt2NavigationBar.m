//
//  UINavigationController+TTExt2NavigationBar.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "UINavigationController+TTExt2NavigationBar.h"
#import <objc/runtime.h>

@implementation UINavigationController (TTExt2NavigationBar)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector = @selector(tt_pushViewController:animated:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)tt_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if (!self.navigationBarHidden) {
//        
//    }
//    if (self.viewControllers.count > 0) {
//        vc_base.hidesBottomBarWhenPushed = YES;
//    }
//    if (vc_base.jNavigationBarHidden) {
//        vc_base.j_navigationBar.hidden = YES;
//    }
//    vc_base.j_navigationBar.items.firstObject.title = vc_base.j_title;
//    if (![self.viewControllers containsObject:viewController]) {
//        [self j_pushViewController:viewController animated:animated];
//    }
}

@end
