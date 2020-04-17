//
//  MJStudent.m
//  Interview01-cache
//
//  Created by MJ Lee on 2018/5/22.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJStudent.h"
#import "MJPerson1.h"
#import <objc/runtime.h>
// 119研究self和super

/*
    [super message]底层原理
    1.消息接受者仍然是self子类对象
    2.从父类开始查找方法实现
 */

@implementation MJStudent
- (void)personTest{
    //super调用的receive仍然是self
    //super作用从那里搜索方法实现
    [super personTest];
   
    /*[super personTest] 底层实现
   
     struct objc_super {
     id receiver;
     Class super_class
     };
     
     struct __rw_objc_super arg ={
        self,
        class_getSuperclass(objc_getClass("MJStudent")) //Person
    };
     
    objc_msgSendSuper(arg,@selector(personTest));
     
      */
}
- (instancetype)init{
    self = [super init];
    if (self) {
        
        NSLog(@"[self class]=%@",[self class]);
        NSLog(@"[super class]=%@",[super class]);
        NSLog(@"[self superclass]=%@",[self superclass]);
        NSLog(@"[super superclass]=%@",[super superclass]);
        
        //类 == 元类
        BOOL tag1=[[NSObject class] isKindOfClass:[NSObject class]];
        BOOL tag2=[[NSObject class] isMemberOfClass:[NSObject class]];
        
        //objc_msgSendSuper((self,父类),@selector(class));
        BOOL tag3=[[MJPerson1 class] isKindOfClass:[MJPerson1 class]];
        BOOL tag4=[[MJPerson1 class] isMemberOfClass:[MJPerson1 class]];
        NSLog(@"%d %d %d %d",tag1,tag2,tag3,tag4);
        
    }
    return self;
}
- (void)studentTest
{
    NSLog(@"%s", __func__);
}

- (Class)class{
    //self对象 返回类
    //self类 返回原类
    return object_getClass(self);
}
@end
