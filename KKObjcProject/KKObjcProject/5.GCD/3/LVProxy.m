//
//  LVProxy.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/7.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "LVProxy.h"

@implementation LVProxy
+ (instancetype)proxyWithTarget:(id)target{
    LVProxy *proxy = [[LVProxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//- (void)forwardInvocation:(NSInvocation *)anInvocation

@end
