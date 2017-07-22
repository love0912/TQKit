//
//  UIViewController+TTExt2Back.h
//  TQKit
//
//  Created by 天智慧启 on 2017/7/21.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 返回操作快捷方法
 */
@interface UIViewController (TTExt2Back)

#pragma mark - UINavigationController

- (void)tt_pop;

- (void)tt_popToAnimated:(BOOL)animated;

- (void)tt_popToViewController:(NSString *)vcName;

- (void)tt_popToViewController:(NSString *)vcName animated:(BOOL)animated;

- (void)tt_pushViewController:(UIViewController *)viewController;

- (void)tt_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;


@end
