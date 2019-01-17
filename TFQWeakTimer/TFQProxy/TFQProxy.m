//
//  TFQProxy.m
//  TFQWeakTimer
//
//  Created by 王立志 on 2019/1/17.
//  Copyright © 2019年 Thread_Fight_Queue. All rights reserved.
//

#import "TFQProxy.h"

@interface TFQProxy ()

@property (nonatomic, weak)id target;

@end

@implementation TFQProxy

+ (instancetype)proxyWithTarget:(id)aTarget{
    TFQProxy *proxy = [[TFQProxy alloc] init];
    proxy.target = aTarget;
    return proxy;
}

//自己不能处理这个消息，就会调用这个方法来消息转发，return target，让target来调用这个方法。
- (id)forwardingTargetForSelector:(SEL)aSelector{
    if([self.target respondsToSelector:aSelector]){
        return self.target;
    }
    return nil;
}



@end
