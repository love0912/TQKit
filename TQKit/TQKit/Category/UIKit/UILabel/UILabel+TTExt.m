//
//  UILabel+TTExt.m
//  TQKit
//
//  Created by 天智慧启 on 2017/8/23.
//  Copyright © 2017年 guojie. All rights reserved.
//

#import "UILabel+TTExt.h"

@implementation UILabel (TTExt)
@dynamic tt_text;

- (void)setTt_text:(NSString *)tt_text {
    self.text = tt_text == nil ? @"" : tt_text;
}

@end
