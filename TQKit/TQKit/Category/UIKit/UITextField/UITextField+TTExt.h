//
//  UITextField+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (TTExt)

/**
 占位文字颜色
 */
@property (nonatomic, strong) UIColor *tt_placeholderColor;


/**
 去掉两端空格和换行符的值
 */
@property (nonatomic, strong, readonly) NSString *tt_text;

@end

NS_ASSUME_NONNULL_END
