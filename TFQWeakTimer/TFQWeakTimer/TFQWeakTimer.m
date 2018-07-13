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

///创建不带参数的定时器
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector{
    return [self initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:nil];
}

///创建带参数的定时器
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo{
    if(self == [super init]){
        self.target = aTarget;
        self.selector = aSelector;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(repeatAction:) userInfo:userInfo repeats:YES];
    }
    return self;
}

- (void)repeatAction:(NSTimer *)timer{
    //在主线程异步执行方法，防止阻塞。
    dispatch_async(dispatch_get_main_queue(), ^{
        id target = self.target;
        SEL selector = self.selector;
        if([target respondsToSelector:selector]){
            if (timer.userInfo) {
                //同样用下边的方法解决，
                //[target performSelector:selector withObject:timer];
                IMP imp = [target methodForSelector:selector];
                void (*func)(id, SEL, NSTimer*) = (void *)imp;
                func(target, selector, timer);
            }else{
                //这种方式调用方法会报警告，所以用下边的方法解决，这是专门儿给有警告强迫症的孩子的福利。
                //[target performSelector:selector];
                IMP imp = [target methodForSelector:selector];
                void (*func)(id, SEL) = (void *)imp;
                func(target, selector);
            }
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
