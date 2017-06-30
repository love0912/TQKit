//
//  TTScanBoxLine.h
//  QRCodeTest
//
//  Created by 天智慧启 on 2017/6/28.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TTScanBoxLineLocationTopLeft, //左上角
    TTScanBoxLineLocationTopRight, //右上角
    TTScanBoxLineLocationBottomLeft, //左下角
    TTScanBoxLineLocationBottomRight //右下角
} TTScanBoxLineLocation;

@interface TTScanBoxLine : UIView

/**
 创建扫描框的转角线

 @param lineColor 线条颜色
 @param lineWidth 线条宽度
 @param lineLength 线条长度
 @param cornerPoint 转角点的位置
 @param cornerLocation 角度的方向
 @return 转角线的视图
 */
+ (TTScanBoxLine *)createLine2Color:(UIColor *)lineColor
                       lineWidth:(CGFloat)lineWidth
                      lineLength:(CGFloat)lineLength
                     cornerPoint:(CGPoint)cornerPoint
                  cornerLocation:(TTScanBoxLineLocation)cornerLocation;

@end
