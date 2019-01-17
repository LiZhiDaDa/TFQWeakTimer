//
//  TFQProxySubclass.h
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFQProxySubclass : NSProxy

+ (instancetype)proxyWithTarget:(id)aTarget;

@end
