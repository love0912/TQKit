//
//  UIViewController+TTExt2Back.m
//  TQKit
//
//  Created by 天智慧启 on 2017/7/21.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "UIViewController+TTExt2Back.h"
#import "UINavigationController+TTExt.h"

@implementation UIViewController (TTExt2Back)

#pragma mark - UINavigationController

- (void)tt_pop {
    [self tt_popToAnimated:YES];
}

- (void)tt_popToAnimated:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}

- (void)tt_popToViewController:(NSString *)vcName {
    [self tt_popToViewController:vcName animated:YES];
}

- (void)tt_popToViewController:(NSString *)vcName animated:(BOOL)animated {
    [self.navigationController tt_popToViewController:vcName animated:animated];
}

- (void)tt_pushViewController:(UIViewController *)viewController {
    [self tt_pushViewController:viewController animated:YES];
}

- (void)tt_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController pushViewController:viewController animated:animated];
}

@end
