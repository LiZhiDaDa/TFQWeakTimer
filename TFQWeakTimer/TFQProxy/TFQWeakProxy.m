//
//  TFQWeakProxy.m
//  TFQFPSLabel
//
//  Created by 王立志 on 2020/1/16.
//  Copyright © 2020 Thread_Fight_Queue. All rights reserved.
//

#import "TFQWeakProxy.h"

@interface TFQWeakProxy ()

@property (nonatomic, weak) id target;

@end

@implementation TFQWeakProxy

- (instancetype)initWithTarget:(id)target{
    if(self == [super init]){
        self.target = target;
    }
    return self;
}

+ (instancetype)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}

///这里可以参考消息转发流程 https://www.cnblogs.com/zhou--fei/p/10188140.html  查看方法调用都涉及到哪些系统方法，在方法指派的时候做手脚即可
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    void *null = NULL;
    [anInvocation setReturnValue:&null];
}

@end
