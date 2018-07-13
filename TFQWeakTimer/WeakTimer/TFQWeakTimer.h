//
//  TFQWeakTimer.h
//  TFQWeakTimer
//
//  Created by 王立志 on 2018/7/13.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFQWeakTimer : NSObject

- (instancetype)initWithTarget:(id)target andTimeInterval:(NSTimeInterval)timeInterval andSelector:(SEL)selector;

- (void)invalidateTimer;

@end
