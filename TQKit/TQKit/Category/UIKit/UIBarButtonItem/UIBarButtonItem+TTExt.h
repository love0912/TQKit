//
//  UIBarButtonItem+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (TTExt)

@property (nullable, nonatomic, copy) void (^tt_actionBlock)(id);

@end

NS_ASSUME_NONNULL_END
