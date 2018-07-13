//
//  TFQWeakTimer.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2018/7/13.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQWeakTimer.h"

@interface TFQWeakTimer ()

@property (nonatomic, assign)SEL selector;
@property (nonatomic, weak)id target;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation TFQWeakTimer

- (instancetype)initWithTarget:(id)target andTimeInterval:(NSTimeInterval)timeInterval andSelector:(SEL)selector{
    if(self == [super init]){
        self.target = target;
        self.selector = selector;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(repeatAction) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)repeatAction{
    //在主线程异步执行方法，防止阻塞。
    dispatch_async(dispatch_get_main_queue(), ^{
        id target = self.target;
        SEL selector = self.selector;
        if([target respondsToSelector:selector]){
            [target performSelector:selector];
        }
    });
}

- (void)invalidateTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)dealloc{
    NSLog(@"TFQWeakTimer dealloc");
}

@end
