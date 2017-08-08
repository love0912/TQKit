//
//  UIView+TTExt2TouchArea.h
//  TQKit
//
//  Created by 天智慧启 on 2017/8/6.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TTExt2TouchArea)

#pragma mark - 点击热区

/**
 *  @brief  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets tt_touchAreaInsets;

@end
