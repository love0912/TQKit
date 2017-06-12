//
//  UIImageView+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (TTExt)

/**
 *  @brief  根据bundle中的图片名创建imageview
 *
 *  @param imageName bundle中的图片名
 *
 *  @return imageview
 */
+ (id)tt_imageViewWithImageNamed:(NSString*)imageName;

/**
 根据frame创建imageview
 
 @param imageName <#imageName description#>
 @param frame <#frame description#>
 @return <#return value description#>
 */
+ (id)tt_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;

/**
 *  @brief  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)tt_imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;

#pragma mark - 画水印

/**
 图片水印
 
 @param image <#image description#>
 @param mark <#mark description#>
 @param rect <#rect description#>
 */
- (void)tt_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;

/**
 文字水印
 
 @param image <#image description#>
 @param markString <#markString description#>
 @param rect <#rect description#>
 @param color <#color description#>
 @param font <#font description#>
 */
- (void)tt_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)tt_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

#pragma mark - 倒影
/**
 *  @brief  倒影
 */
- (void)tt_reflect;

@end

NS_ASSUME_NONNULL_END


