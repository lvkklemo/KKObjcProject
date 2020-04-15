//
//  MJPerson1.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/13.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "MJPerson1.h"
#import <objc/runtime.h>
@implementation MJPerson1
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

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    return [super forwardingTargetForSelector:aSelector];
}
@end
