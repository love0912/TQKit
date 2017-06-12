//
//  UIScrollView+TTExt.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "UIScrollView+TTExt.h"

@implementation UIScrollView (TTExt)

/**
 Scroll content to top with animation.
 */
- (void)tt_scrollToTop {
    [self tt_scrollToTopAnimated:YES];
}

/**
 Scroll content to bottom with animation.
 */
- (void)tt_scrollToBottom {
    [self tt_scrollToBottomAnimated:YES];
}

/**
 Scroll content to left with animation.
 */
- (void)tt_scrollToLeft {
    [self tt_scrollToLeftAnimated:YES];
}

/**
 Scroll content to right with animation.
 */
- (void)tt_scrollToRight {
    [self tt_scrollToRightAnimated:YES];
}

/**
 Scroll content to top.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

/**
 Scroll content to bottom.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

/**
 Scroll content to left.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

/**
 Scroll content to right.
 
 @param animated  Use animation.
 */
- (void)tt_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
