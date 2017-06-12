//
//  NSDictionary+TTExt.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "NSDictionary+TTExt.h"

@implementation NSDictionary (TTExt)

/**
 返回所有key (按字典序排列)
 
 @return key array
 */
- (NSArray *)tt_allKeysSorted {
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

/**
 返回所有value (按key的字典序排列)
 
 @return value array
 */
- (NSArray *)tt_allValuesSortedByKeys {
    NSArray *sortedKeys = [self tt_allKeysSorted];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id key in sortedKeys) {
        [arr addObject:self[key]];
    }
    return arr;
}

/**
 是否包含 key
 
 @param key key
 @return yes/no
 */
- (BOOL)tt_containsObjectForKey:(id)key {
    return [[self allKeys] containsObject:key];
}

/**
 根据一组 key 来取对象
 
 @param keys key array
 @return value array
 */
- (NSDictionary *)tt_entriesForKeys:(NSArray *)keys {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:keys.count];
    for (id key in keys) {
        id value = self[key];
        if (value) dic[key] = value;
    }
    return dic;
}

@end
