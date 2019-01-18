//
//  TFQGCDTimer.h
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFQGCDTimer : NSObject


+ (NSString *)schedleTask:(void (^)(void))task interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async reuseIdentifier:(NSString *)identifier;

+ (void)cancelTimer:(NSString *)timerKey;

@end
