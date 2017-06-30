//
//  TTQRCodeScan.h
//  QRCodeTest
//
//  Created by 天智慧启 on 2017/6/29.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ScanResultBlock)(NSString *result);

@interface TTQRCodeScan : NSObject

- (instancetype)initWithParentView:(UIView *)parentView scanFrame:(CGRect)scanFrame result:(ScanResultBlock)result;

- (void)startScanning;

- (void)stopScanning;

@property (nonatomic, strong) UIColor *lineColor;

- (void)openTorch;

- (void)closeTorch;

@end
