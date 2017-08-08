//
//  UIView+TTExt2TouchArea.m
//  TQKit
//
//  Created by 天智慧启 on 2017/8/6.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "UIView+TTExt2TouchArea.h"
#import <objc/runtime.h>

@implementation UIView (TTExt2TouchArea)

#pragma mark - 点击热区
- (UIEdgeInsets)tt_touchAreaInsets
{
    return [objc_getAssociatedObject(self, @selector(tt_touchAreaInsets)) UIEdgeInsetsValue];
}

/**
 *  @brief  设置按钮额外热区
 */
- (void)setTt_touchAreaInsets:(UIEdgeInsets)touchAreaInsets
{
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, @selector(tt_touchAreaInsets), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIEdgeInsets touchAreaInsets = self.tt_touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left,
                        bounds.origin.y - touchAreaInsets.top,
                        bounds.size.width + touchAreaInsets.left + touchAreaInsets.right,
                        bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    return CGRectContainsPoint(bounds, point);
}

@end
