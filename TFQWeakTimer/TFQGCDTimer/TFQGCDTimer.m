//
//  TFQGCDTimer.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQGCDTimer.h"


static NSMutableDictionary *timerDict;

@implementation TFQGCDTimer

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timerDict = [NSMutableDictionary dictionaryWithCapacity:1];
    });
}

+ (NSString *)schedleTask:(void (^)(void))task interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async reuseIdentifier:(NSString *)identifier{
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    //穿件定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //开始时间
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 0*NSEC_PER_SEC);
    //设置各种时间
    dispatch_source_set_timer(timer, start, interval*NSEC_PER_SEC, 0);
    //设置回调
    dispatch_source_set_event_handler(timer, ^{
        task();
        if(!repeat){
            [self cancelTimer:identifier];
        }
    });
    //启动定时器
    dispatch_resume(timer);
    timerDict[identifier] = timer;
    return identifier;
}

+ (void)cancelTimer:(NSString *)identifier{
    dispatch_source_cancel(timerDict[identifier]);
    [timerDict removeObjectForKey:identifier];
}

@end
