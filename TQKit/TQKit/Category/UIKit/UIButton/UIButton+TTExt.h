//
//  UIButton+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TouchUpInsideEvent)(UIButton *button);

@interface UIButton (TTExt)

@property (nonatomic, strong) TouchUpInsideEvent touchUpInsideEvent;


/**
 创建Button
 
 @param frame frame
 @param title 标题 - Normal
 @param touchUpInsideEvent 点击事件
 @return 创建好的Button
 */
+ (UIButton *)tt_createWithFrame:(CGRect)frame title:(NSString *)title touchUpInsideEvent:(TouchUpInsideEvent)touchUpInsideEvent;

/**
 <#Description#>
 
 @param frame frame
 @param title 标题 - Normal
 @param image 图片
 @param touchUpInsideEvent 点击事件
 @return 创建好的Button
 */
+ (UIButton *)tt_createWithFrame:(CGRect)frame title:(NSString *)title image:(nullable UIImage *)image touchUpInsideEvent:(TouchUpInsideEvent)touchUpInsideEvent;

/**
 创建button
 
 @param frame frame
 @param title 标题 - Normal
 @param image 图片
 @param touchUpInsideEvent 点击事件
 @return 创建好的Button
 */
+ (UIButton *)tt_createWithFrame:(CGRect)frame title:(NSString *)title image:(nullable UIImage *)image tag:(NSInteger)tag touchUpInsideEvent:(TouchUpInsideEvent)touchUpInsideEvent;

/**
 *  设置高亮图片
 *
 *  @param image 高亮图片
 */
- (void)tt_setHighlightedImage:(UIImage *)image;

/**
 *  返回高亮图片
 *
 *  @return 高亮图片
 */
- (UIImage *)tt_highlightedImage;

/**
 *  设置普通图片
 *
 *  @param image 普通图片
 */
- (void)tt_setNormalImage:(UIImage *)image;

/**
 *  返回普通图片
 *
 *  @return 普通图片
 */
- (UIImage *)tt_normalImage;

/**
 *  设置选中的图片
 *
 *  @param image 选中的图片
 */
- (void)tt_setSelectedImage:(UIImage *)image;

/**
 *  返回选中的图片
 *
 *  @return 选中的图片
 */
- (UIImage *)tt_selectedImage;


/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)tt_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 设置下划线,颜色跟按钮颜色一致
 */
- (void)tt_setUnderLine;

#pragma mark - 点击热区

/**
 *  @brief  设置按钮额外热区
 */
@property (nonatomic, assign) UIEdgeInsets tt_touchAreaInsets;

@end

NS_ASSUME_NONNULL_END
