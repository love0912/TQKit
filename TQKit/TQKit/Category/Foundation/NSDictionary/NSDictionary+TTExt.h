//
//  NSDictionary+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_STATIC_INLINE BOOL NSDictionaryIsEmpty(NSDictionary *dictionary)
{
    if (dictionary && dictionary.count > 0 ) return NO;
    
    return YES;
}

@interface NSDictionary (TTExt)

/**
 返回所有key (按字典序排列)
 
 @return key array
 */
- (NSArray *)tt_allKeysSorted;


/**
 返回所有value (按key的字典序排列)
 
 @return value array
 */
- (NSArray *)tt_allValuesSortedByKeys;


/**
 是否包含 key
 
 @param key key
 @return yes/no
 */
- (BOOL)tt_containsObjectForKey:(id)key;


/**
 根据一组 key 来取对象
 
 @param keys key array
 @return value array
 */
- (NSDictionary *)tt_entriesForKeys:(NSArray *)keys;


@end

NS_ASSUME_NONNULL_END
