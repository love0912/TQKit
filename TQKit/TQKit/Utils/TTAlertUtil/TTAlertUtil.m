//
//  TTAlertUtil.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/19.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "TTAlertUtil.h"
#import <objc/runtime.h>
#import "NSString+TTExt.h"
#define JIOS8Later [[[UIDevice currentDevice] systemVersion] doubleValue] > 8.0

const char *TTAlertSheet_Block = "TTAlertSheet_Block";

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
@interface UIAlertView (TTAlertView)
-(void)setClickBlock:(ClickAtIndexBlock)block;
-(ClickAtIndexBlock)clickBlock;
@end

@implementation UIAlertView (TTAlertView)
-(void)setClickBlock:(ClickAtIndexBlock)block {
    objc_setAssociatedObject(self, TTAlertSheet_Block, block, OBJC_ASSOCIATION_COPY);
}
-(ClickAtIndexBlock)clickBlock {
    return objc_getAssociatedObject(self, TTAlertSheet_Block);
}
@end

@interface UIActionSheet (TTActionSheet)
-(void)setClickBlock:(ClickAtIndexBlock)block;
-(ClickAtIndexBlock)clickBlock;
@end

@implementation UIActionSheet (TTActionSheet)
-(void)setClickBlock:(ClickAtIndexBlock)block {
    objc_setAssociatedObject(self, TTAlertSheet_Block, block, OBJC_ASSOCIATION_COPY);
}
-(ClickAtIndexBlock)clickBlock {
    return objc_getAssociatedObject(self, TTAlertSheet_Block);
}
@end

@implementation TTAlertUtil
#pragma mark - alert
+ (void)showAlertWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle OtherButtonsArray:(NSArray*)otherButtons showInController:(UIViewController *)controller clickAtIndex:(ClickAtIndexBlock) clickAtIndex {
    if (JIOS8Later && controller != nil) {
        int index = 0;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:messge preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancleButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            clickAtIndex(index);
        }];
        [alert addAction:cancel];
        for (NSString *otherTitle in otherButtons) {
            index ++;
            UIAlertAction *action = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                clickAtIndex(index);
            }];
            [alert addAction:action];
        }
        [controller presentViewController:alert animated:YES completion:nil];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:title message:messge delegate:self cancelButtonTitle:cancleButtonTitle otherButtonTitles: nil];
#pragma clang diagnostic pop
        alert.clickBlock = clickAtIndex;
        for (NSString *otherTitle in otherButtons) {
            [alert addButtonWithTitle:otherTitle];
        }
        [alert show];
    }
}

#pragma mark UIAlertViewDelegate

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
+(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.clickBlock) {
        alertView.clickBlock(buttonIndex);
    }
}
#pragma clang diagnostic pop


#pragma mark - actionSheet
+ (UIAlertController *)showActionSheetWithTitle:(NSString*)title message:(NSString *)messge cancleButtonTitle:(NSString *)cancleButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle OtherButtonsArray:(NSArray*)otherButtons showInController:(UIViewController *)controller clickAtIndex:(ClickAtIndexBlock) clickAtIndex {
    
    if (JIOS8Later && controller != nil) {
        int index = 0;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:messge preferredStyle:UIAlertControllerStyleActionSheet];
        if ([destructiveButtonTitle tt_isNotEmpty]) {
            UIAlertAction *destructive = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                clickAtIndex(index);
            }];
            [alert addAction:destructive];
        }
        index++;
        if ([cancleButtonTitle tt_isNotEmpty]) {
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:cancleButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                clickAtIndex(index);
            }];
            [alert addAction:cancel];
        }
        for (NSString *otherTitle in otherButtons) {
            index ++;
            UIAlertAction *action = [UIAlertAction actionWithTitle:otherTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                clickAtIndex(index);
            }];
            [alert addAction:action];
        }
        [controller presentViewController:alert animated:YES completion:nil];
        return alert;
    } else {
        UIActionSheet *alert = [[UIActionSheet alloc] initWithTitle:title delegate:[self self] cancelButtonTitle:cancleButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:nil];
        alert.clickBlock = clickAtIndex;
        for (NSString *otherTitle in otherButtons) {
            [alert addButtonWithTitle:otherTitle];
        }
        if (controller != nil) {
            [alert showInView:controller.view];
        } else {
            [alert showInView:[UIApplication sharedApplication].keyWindow];
        }
        return nil;
    }
}

+ (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    actionSheet.clickBlock(buttonIndex);
}
@end

#pragma clang diagnostic pop
