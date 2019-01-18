//
//  TFQGCDTimer.h
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFQGCDTimer : NSObject



/**
 GCD创建定时器

 @param task 定时器内容
 @param interval 执行间隔
 @param repeat 是否重复
 @param async 是否异步
 @param identifier 定时器唯一ID
 @return 返回定时器唯一ID，销毁的时候用
 */
+ (NSString *)schedleTask:(void (^)(void))task interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async reuseIdentifier:(NSString *)identifier;

+ (void)cancelTimer:(NSString *)timerKey;

@end
