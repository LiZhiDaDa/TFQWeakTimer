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
    return identifier;
}

+ (void)cancelTimer:(NSString *)identifier{
    dispatch_source_cancel(timerDict[identifier]);
    [timerDict removeObjectForKey:identifier];
}

@end
