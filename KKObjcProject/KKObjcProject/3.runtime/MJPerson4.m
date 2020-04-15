//
//  MJPerson4.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "MJPerson4.h"
#import "objc/runtime.h"

@interface MJPerson4 ()
{
    int _kkage;
}
@end
@implementation MJPerson4
//自动生成成员变量_age,set&get方法实现,默认省略
//@synthesize age = _age;
//提醒编辑器不自动生成成员变量_age,set&get方法实现
@dynamic age;

- (void)kkSetAge:(int)kAge{
    NSLog(@"kkage = %d",kAge);
    _kkage = kAge;
}

- (int)kkAge{
    return _kkage;
}
//动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(setAge:)) {
        Method method = class_getInstanceMethod(self, @selector(kkSetAge:));
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        return YES;
    }
    if (sel == @selector(age)) {
        Method method = class_getInstanceMethod(self, @selector(kkAge));
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
- (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"%s",__func__);
}
@end
