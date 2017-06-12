//
//  NSTimer+TTExt.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "NSTimer+TTExt.h"

@implementation NSTimer (TTExt)

/**
 *  开启一个当前线程内可重复执行的NSTimer对象
 *
 *  @param inTimeInterval 重复时间
 *  @param inBlock        操作内容
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer对象
 */
+(id)tt_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats {
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(ttExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}
/**
 *  开启一个需添加到线程的可重复执行的NSTimer对象
 *
 *  @param inTimeInterval 重复时间
 *  @param inBlock        操作内容
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer对象
 */
+(id)tt_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats {
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(ttExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}
/**
 *  暂停NSTimer
 */
- (void)tt_pauseTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}
/**
 *   开始NSTimer
 */
- (void)tt_resumeTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}
/**
 *  延迟开始NSTimer
 */
- (void)tt_resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return ;
    }
    
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

#pragma mark - private
+(void)ttExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
