//
//  UIButton+TTExt2Layer.h
//  TQKit
//
//  Created by 天智慧启 on 2017/7/31.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TTExt2Layer)

/**
 按钮圆角
 */
@property (nonatomic, assign) CGFloat tt_cornerRadius;

/**
 边框宽度
 */
@property (nonatomic, assign) CGFloat tt_borderWidth;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor *tt_borderColor;

@end
