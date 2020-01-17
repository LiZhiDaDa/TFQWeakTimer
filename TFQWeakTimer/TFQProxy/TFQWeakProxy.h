//
//  TFQWeakProxy.h
//  TFQFPSLabel
//
//  Created by 王立志 on 2020/1/16.
//  Copyright © 2020 Thread_Fight_Queue. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFQWeakProxy : NSObject

+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
