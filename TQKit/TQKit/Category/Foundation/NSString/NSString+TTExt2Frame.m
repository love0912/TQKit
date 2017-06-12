//
//  NSString+TTExt2Frame.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "NSString+TTExt2Frame.h"

@implementation NSString (TTExt2Frame)

/**
 *  @brief 根据字数的不同,返回UILabel中的text文字需要占用多少Size
 *  @param size 约束的尺寸
 *  @param font 文本字体
 *  @return 文本的实际尺寸
 */
- (CGSize)tt_sizeWithFont:(UIFont *)font size:(CGSize)size {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    }
    return result;
}

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param width 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际高度
 */
- (CGFloat)tt_heightWithFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self tt_sizeWithFont:font size:CGSizeMake(width, HUGE)];
    return size.height;
}

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param font  文本字体
 *  @return 文本的实际长度
 */
- (CGFloat)tt_widthWithFont:(UIFont *)font {
    CGSize size = [self tt_sizeWithFont:font size:CGSizeMake(HUGE, HUGE)];
    return size.width;
}

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param height 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际长度
 */
- (CGFloat)tt_widthWithFont:(UIFont *)font height:(CGFloat)height {
    CGSize size = [self tt_sizeWithFont:font size:CGSizeMake(HUGE, height)];
    return size.width;
}

@end
