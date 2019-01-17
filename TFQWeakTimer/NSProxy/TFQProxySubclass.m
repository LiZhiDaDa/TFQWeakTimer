//
//  TFQProxySubclass.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQProxySubclass.h"

@interface TFQProxySubclass ()

@property (nonatomic, weak)id target;

@end

@implementation TFQProxySubclass

+ (instancetype)proxyWithTarget:(id)aTarget{
    TFQProxySubclass *proxy = [TFQProxySubclass alloc];
    proxy.target = aTarget;
    return proxy;
}

//为另一个类实现的消息创建一个有效的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

//将选择器转发给一个真正实现了该消息的对象
- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}

@end
