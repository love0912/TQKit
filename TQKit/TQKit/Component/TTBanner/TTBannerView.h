//
//  TTBannerView.h
//  CQRunner
//
//  Created by 郭界 on 2017/6/27.
//  Copyright © 2017年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTBannerFooter.h"

@class TTBannerView;

@protocol TTBannerViewDataSource <NSObject>
@required

/**
 返回 Banner 需要显示 Item(View) 的个数
 */
- (NSInteger)tt_numberOfItemsInBannerView:(TTBannerView *)bannerView;

/**
 返回Banner中的View(无需设置 frame)
 */
- (UIView *)tt_bannerView:(TTBannerView *)bannerView viewForItemAtIndex:(NSInteger)index;

@optional

/**
 返回 Footer 在不同状态时要显示的文字 ,如果需要
 */
- (NSString *)tt_bannerView:(TTBannerView *)banner titleForFooterWithState:(TTBannerFooterState)footerState;
@end

@protocol TTBannerViewDelegate <NSObject>

/**
 点击Banner的view
 */
- (void)tt_bannerView:(TTBannerView *)bannerView didSelectItemAtIndex:(NSInteger)index;
/**
 滚动到某个view
 */
- (void)tt_bannerView:(TTBannerView *)banner didScrollToItemAtIndex:(NSInteger)index;

/**
 释放进入下一页面
 */
- (void)tt_bannerFooterDidEnter:(TTBannerView *)banner;
@end

@interface TTBannerView : UIView

/**
 是否自动循环,默认NO
 */
@property (nonatomic, assign, getter=isCycle) IBInspectable BOOL cycle;

/**
 是否显示 footer, 默认为 NO (此属性为 YES 时, cycle 会被置为 NO)
 */
@property (nonatomic, assign, getter=isShowFooter) IBInspectable BOOL showFooter;

/**
 是否自动滑动, 默认为 NO
 */
@property (nonatomic, assign) IBInspectable BOOL autoScroll;

/**
 自动滑动间隔时间(s), 默认为 3.0
 */
@property (nonatomic, assign) IBInspectable CGFloat scrollInterval;

/**
 UIPageControl
 */
@property (nonatomic, strong, readonly) UIPageControl *pageControl;
@property (nonatomic, assign, readwrite)  CGRect pageControlFrame;

/**
 当前的item
 */
@property (nonatomic, assign) NSInteger currentIndex;
- (void)setCurrentIndex:(NSInteger)currentIndex animated:(BOOL)animated;

@property (nonatomic, weak) IBOutlet id<TTBannerViewDataSource> dataSource;
@property (nonatomic, weak) IBOutlet id<TTBannerViewDelegate> delegate;

- (void)reloadData;

@end
