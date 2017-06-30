//
//  TTScanBoxLine.m
//  QRCodeTest
//
//  Created by 天智慧启 on 2017/6/28.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "TTScanBoxLine.h"

@interface TTScanBoxLine ()

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) CGFloat lineLength;

@property (nonatomic, assign) CGPoint cornerPoint;

@property (nonatomic, assign) TTScanBoxLineLocation cornerLocation;

@end

@implementation TTScanBoxLine

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
                  cornerLocation:(TTScanBoxLineLocation)cornerLocation {
    TTScanBoxLine *boxLine = [[TTScanBoxLine alloc] initWithLine2Color:lineColor lineWidth:lineWidth lineLength:lineLength cornerPoint:cornerPoint cornerLocation:cornerLocation];
    [boxLine setNeedsDisplay];
    return boxLine;
}

- (instancetype)initWithLine2Color:(UIColor *)lineColor
                         lineWidth:(CGFloat)lineWidth
                        lineLength:(CGFloat)lineLength
                       cornerPoint:(CGPoint)cornerPoint
                    cornerLocation:(TTScanBoxLineLocation)cornerLocation {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.frame = [self frameByCornerLocation:cornerLocation origin:cornerPoint width:lineLength];
        self.lineColor = lineColor;
        self.lineLength = lineLength;
        self.lineWidth = lineWidth;
        self.cornerPoint = cornerPoint;
        self.cornerLocation = cornerLocation;
    }
    return self;
}

- (CGRect)frameByCornerLocation:(TTScanBoxLineLocation)cornerLocation origin:(CGPoint)origin width:(CGFloat)width {
    CGRect frame = CGRectZero;
    switch (cornerLocation) {
        case TTScanBoxLineLocationTopLeft:
            frame = CGRectMake(origin.x, origin.y, width, width);
            break;
        case TTScanBoxLineLocationBottomLeft:
            frame = CGRectMake(origin.x, origin.y - width, width, width);
            break;
        case TTScanBoxLineLocationTopRight:
            frame = CGRectMake(origin.x - width, origin.y, width, width);
            break;
        case TTScanBoxLineLocationBottomRight:
            frame = CGRectMake(origin.x - width, origin.y - width, width, width);
            break;
        default:
            break;
    }
    return frame;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, self.lineWidth);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor); //线的颜色
    CGContextBeginPath(context);
    
    [self drawLineByContext:context];
}

- (void)drawLineByContext:(CGContextRef)context {
    CGPoint startPoint = CGPointZero;
    CGPoint xEndPoint = CGPointZero;
    CGPoint yEndPoint = CGPointZero;
    switch (self.cornerLocation) {
        case TTScanBoxLineLocationTopLeft:
        {
            startPoint = CGPointZero;
            xEndPoint = CGPointMake(self.lineLength, 0);
            yEndPoint = CGPointMake(0, self.lineLength);
        }
            break;
        case TTScanBoxLineLocationBottomLeft:
        {
            startPoint = CGPointMake(0, self.bounds.size.height);
            xEndPoint = CGPointMake(self.lineLength, self.bounds.size.height);
            yEndPoint = CGPointMake(0, self.bounds.size.height - self.lineLength);
        }
            break;
        case TTScanBoxLineLocationTopRight:
        {
            startPoint = CGPointMake(self.bounds.size.width, 0);
            xEndPoint = CGPointMake(self.bounds.size.width - self.lineLength, 0);
            yEndPoint = CGPointMake(self.bounds.size.width, self.lineLength);
        }
            break;
        case TTScanBoxLineLocationBottomRight:
        {
            startPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height);
            xEndPoint = CGPointMake(self.bounds.size.width - self.lineLength, self.bounds.size.height);
            yEndPoint = CGPointMake(self.bounds.size.width, self.bounds.size.height - self.lineLength);
        }
            break;
        default:
            break;
    }
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);  //起点坐标
    CGContextAddLineToPoint(context, xEndPoint.x, xEndPoint.y); // X 终点坐标
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);  //起点坐标
    CGContextAddLineToPoint(context, yEndPoint.x, yEndPoint.y);   // Y 终点坐标
    CGContextStrokePath(context);
}

@end
