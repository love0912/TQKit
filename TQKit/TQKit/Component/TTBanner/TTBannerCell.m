//
//  TTBannerCell.m
//  CQRunner
//
//  Created by 郭界 on 2017/6/27.
//  Copyright © 2017年 jason. All rights reserved.
//

#import "TTBannerCell.h"

@implementation TTBannerCell
@synthesize containerView = _containerView;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.containerView.frame = self.bounds;
}

#pragma mark - getters、setters
- (UIView *)containerView {
    if (_containerView == nil) {
        _containerView = [[UIView alloc] init];
    }
    return _containerView;
}

- (void)setContainerView:(UIView *)containerView {
    if (_containerView) {
        [_containerView removeFromSuperview];
    }
    _containerView = containerView;
    [self addSubview:_containerView];
}

@end
