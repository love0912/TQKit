//
//  NSUserDefaults+TTExt.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "NSUserDefaults+TTExt.h"

@implementation NSUserDefaults (TTExt)

+ (void)tt_setObject:(id)obj forKey:(NSString *)key {
    [[self standardUserDefaults] setObject:obj forKey:key];
    [[self standardUserDefaults] synchronize];
}

+ (id)tt_objectForKey:(NSString *)key {
    id value = [[self standardUserDefaults] objectForKey:key];
    return value;
}

@end
