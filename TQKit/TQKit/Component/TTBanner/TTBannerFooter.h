//
//  TTBannerFooter.h
//  CQRunner
//
//  Created by 天智慧启 on 2017/6/27.
//  Copyright © 2017年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TTBannerFooterState) {
    TTBannerFooterStateNormal = 0,    // 正常状态下的footer提示
    TTBannerFooterStateEnter,     // 进入下一页的footer提示
};

@interface TTBannerFooter : UICollectionReusableView

@property (nonatomic, assign) TTBannerFooterState state;

@property (nonatomic, strong) UIImageView *imgv_arrow;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *normalTitle;
@property (nonatomic, copy) NSString *enterTitle;

@end
