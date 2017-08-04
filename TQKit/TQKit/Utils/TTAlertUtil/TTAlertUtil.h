//
//  TTAlertUtil.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/19.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTAlertUtil : NSObject<UIAlertViewDelegate, UIActionSheetDelegate>

typedef void (^ClickAtIndexBlock)(NSInteger buttonIndex);

+ (void)showAlertWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle OtherButtonsArray:(NSArray*)otherButtons showInController:(UIViewController *)controller clickAtIndex:(ClickAtIndexBlock) clickAtIndex;

+ (UIAlertController *)showActionSheetWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle OtherButtonsArray:(NSArray*)otherButtons showInController:(UIViewController *)controller clickAtIndex:(ClickAtIndexBlock) clickAtIndex;

@end
