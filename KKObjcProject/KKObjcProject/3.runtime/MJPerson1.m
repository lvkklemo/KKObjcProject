//
//  MJPerson1.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/13.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "MJPerson1.h"
#import <objc/runtime.h>
#import "Person3.h"

@implementation MJPerson1
- (void)personTest{
    NSLog(@"%s",__func__);
}
//1.消息发送
//- (void)personTest:(NSString*)name{
//    NSLog(@"%s", __func__);
//}

//2.动态方法解析

struct method_t{
    SEL sel;
    char*types;
    IMP imp;
};
- (void)otherMethod:(NSString*)name{
    NSLog(@"%s",__func__);
}
/*2.1
 + (BOOL)resolveInstanceMethod:(SEL)sel{
 NSLog(@"%s",__func__);
 if (sel == @selector(personTest:)) {
 Method method = class_getInstanceMethod(self, @selector(otherMethod:));
 struct method_t *smethod = (struct method_t *)method;
 class_addMethod(self, sel, smethod->imp, smethod->types);
 //返回yes表示有动态添加方法
 return YES;
 }
 return [super resolveInstanceMethod:sel];
 }
 */

/*2.2
 + (BOOL)resolveInstanceMethod:(SEL)sel{
 NSLog(@"%s",__func__);
 if (sel == @selector(personTest:)) {
 Method method = class_getInstanceMethod(self, @selector(otherMethod:));
 class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
 //返回yes表示有动态添加方法
 return YES;
 }
 return [super resolveInstanceMethod:sel];
 }
 //查看汇编 Debug-->Debug Workflow --> Alway Show Disassemble
 + (void)otherClassMethod{
 NSLog(@"%s",__func__);
 }
 + (BOOL)resolveClassMethod:(SEL)sel{
 if (sel == @selector(test)) {
 //获取原类对象,添加方法
 Method method = class_getClassMethod(self, @selector(otherClassMethod));
 class_addMethod(object_getClass(self), sel, method_getImplementation(method), method_getTypeEncoding(method));
 return YES;
 }
 return [super resolveClassMethod:sel];
 }
*/

//3.消息转发
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(personTest:)) {
//        return [[Person3 alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

//https://blog.csdn.net/zhaochen_009/article/details/54602930?utm_source=blogxgwz3
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
        if (aSelector == @selector(personTest:)) {
            //return [[[Person3 alloc] init] methodSignatureForSelector:@selector(personTest:)];
            //return [NSMethodSignature signatureWithObjCTypes:"v@:*"];
            return [[[Person3 alloc]init] methodSignatureForSelector:aSelector];
        }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{

    //NSInvocation包装方法调用
    //获取NSInvocation参数
    /*
     NSString* name;
     [anInvocation getArgument:&name atIndex:2];
     */

    //返回值
    /*
     NSString* title;
     [anInvocation getReturnValue:&title];
     */
    //调用其它方法
    /*
     anInvocation.selector = @selector(other:);
     [anInvocation invoke];
     */
    
    //消息转发
     [anInvocation invokeWithTarget:[[Person3 alloc]init]];
}

- (void)other:(NSString*)name{
    NSLog(@"%@",name);
}

@end
