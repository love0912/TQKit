//
//  NSUserDefaults+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (TTExt)

+ (void)tt_setObject:(id)obj forKey:(NSString *)key;

+ (id)tt_objectForKey:(NSString *)key;

+ (void)tt_removeObjectForKey:(NSString *)key;

@end
