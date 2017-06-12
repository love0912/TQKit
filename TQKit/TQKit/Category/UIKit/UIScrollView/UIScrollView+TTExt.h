//
//  UIScrollView+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (TTExt)

/**
 Scroll content to top with animation.
 */
- (void)tt_scrollToTop;

/**
 Scroll content to bottom with animation.
 */
- (void)tt_scrollToBottom;

/**
 Scroll content to left with animation.
 */
- (void)tt_scrollToLeft;

/**
 Scroll content to right with animation.
 */
- (void)tt_scrollToRight;

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToTopAnimated:(BOOL)animated;

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToBottomAnimated:(BOOL)animated;

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToLeftAnimated:(BOOL)animated;

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
