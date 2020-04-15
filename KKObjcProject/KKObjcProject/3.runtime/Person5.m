//
//  Person5.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Person5.h"

@implementation Person5

- (void)run{
    NSLog(@"%s",__func__);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //本来可以找到方法
    if ([self respondsToSelector:aSelector]) {
        [super methodSignatureForSelector:aSelector];
    }
    //找不到方法
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"找不到%@方法",NSStringFromSelector([anInvocation selector]));
}

@end
