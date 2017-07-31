//
//  UIButton+TTExt2Layer.m
//  TQKit
//
//  Created by 天智慧启 on 2017/7/31.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "UIButton+TTExt2Layer.h"

@implementation UIButton (TTExt2Layer)

- (void)setTt_cornerRadius:(CGFloat)tt_cornerRadius {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = tt_cornerRadius;
}

- (CGFloat)tt_cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setTt_borderWidth:(CGFloat)tt_borderWidth {
    self.layer.borderWidth = tt_borderWidth;
}

- (CGFloat)tt_borderWidth {
    return self.layer.borderWidth;
}

- (void)setTt_borderColor:(UIColor *)tt_borderColor {
    self.layer.borderColor = tt_borderColor.CGColor;
}

- (UIColor *)tt_borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
@end
