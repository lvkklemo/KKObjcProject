//
//  MJProxy.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/7.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "MJProxy.h"

@implementation MJProxy
+ (instancetype)proxyWithTarget:(id)target{
    MJProxy *proxy = [MJProxy alloc];
    proxy.target = target;
    return proxy;
}
//没有forwardingTargetForSelector

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}

@end
