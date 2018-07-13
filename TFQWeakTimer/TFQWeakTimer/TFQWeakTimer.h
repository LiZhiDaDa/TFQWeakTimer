//
//  TFQWeakTimer.h
//  TFQWeakTimer
//
//  Created by 王立志 on 2018/7/13.
//  Copyright © 2018年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFQWeakTimer : NSObject

///创建不带参数的定时器
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector;

///创建带参数的定时器
- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;

///销毁定时器
- (void)invalidateTimer;

@end
