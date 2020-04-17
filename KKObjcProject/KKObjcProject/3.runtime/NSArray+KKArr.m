//
//  NSArray+KKArr.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "NSArray+KKArr.h"

@implementation NSArray (KKArr)

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //本来可以找到方法
    if ([self respondsToSelector:aSelector]) {
        [super methodSignatureForSelector:aSelector];
    }
    //找不到方法
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"方法%@找不到",NSStringFromSelector(anInvocation.selector));
}
@end
