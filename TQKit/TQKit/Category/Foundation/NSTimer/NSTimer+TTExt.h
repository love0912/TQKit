//
//  NSTimer+TTExt.h
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/15.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (TTExt)

/**
 *  开启一个当前线程内可重复执行的NSTimer对象
 *
 *  @param inTimeInterval 重复时间
 *  @param inBlock        操作内容
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer对象
 */
+(id)tt_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
/**
 *  开启一个需添加到线程的可重复执行的NSTimer对象
 *
 *  @param inTimeInterval 重复时间
 *  @param inBlock        操作内容
 *  @param inRepeats      是否重复
 *
 *  @return NSTimer对象
 */
+(id)tt_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats;
/**
 *  暂停NSTimer
 */
- (void)tt_pauseTimer;
/**
 *   开始NSTimer
 */
- (void)tt_resumeTimer;
/**
 *  延迟开始NSTimer
 */
- (void)tt_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
