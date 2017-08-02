//
//  UITextField+TTExt.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "UITextField+TTExt.h"

/** 通过这个属性名，就可以修改textField内部的占位文字颜色 */
static NSString * const PlaceholderColorKeyPath = @"placeholderLabel.textColor";

@implementation UITextField (TTExt)

- (void)setTt_placeholderColor:(UIColor *)placeholderColor {
    // 这3行代码的作用：1> 保证创建出placeholderLabel，2> 保留曾经设置过的占位文字
    NSString *placeholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = placeholder;
    
    // 处理xmg_placeholderColor为nil的情况：如果是nil，恢复成默认的占位文字颜色
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    
    // 设置占位文字颜色
    [self setValue:placeholderColor forKeyPath:PlaceholderColorKeyPath];
}

- (UIColor *)tt_placeholderColor {
    return [self valueForKeyPath:PlaceholderColorKeyPath];
}

- (NSString *)tt_text {
    return [self.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
