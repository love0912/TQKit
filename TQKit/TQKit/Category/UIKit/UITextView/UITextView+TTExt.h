//
//  UITextView+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/16.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (TTExt)

@property (nonatomic, strong) IBInspectable NSString *tt_placeholder;
@property (nonatomic, strong) NSAttributedString *tt_attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *tt_placeholderColor;

+ (UIColor *)tt_defaultPlaceholderColor;

@end
