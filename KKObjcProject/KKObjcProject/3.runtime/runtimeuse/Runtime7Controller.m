//
//  Runtime7Controller.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/17.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime7Controller.h"
#import <objc/runtime.h>
#import "MKPerson.h"
#import "MKCar.h"
//130
@interface Runtime7Controller ()
@end

@implementation Runtime7Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"runtime使用";
    
    MKPerson*person = [[MKPerson alloc] init];
    [person run];
    //一类
    //1object_getClass  isa指向的东西
    //实例对象 --> 类对象
    //类对象 --> 元类对象
    //NSLog(@"%p %p",[person class],object_getClass(person));
    
    //2object_setClass修改实例对象isa指向
    object_setClass(person, [MKCar class]);
    [person run];
    
    //3是不是一个类对象
    object_isClass(person);
    
    //4动态创建类
    //二
    //获取成员变量信息
    Ivar ageIvar = class_getInstanceVariable([MKPerson class], "_age");
    Ivar nameIvar = class_getInstanceVariable([MKPerson class], "_name");
//    NSLog(@"%s,%s",ivar_getName(ageIvar),ivar_getTypeEncoding(ageIvar));
    //设置获取成员变量值
    object_setIvar(person, nameIvar, @"qinghua");
    //NSLog(@"%@ %@",person.name,object_getIvar(person, nameIvar));
    
    //132获取类对象成员变量
    //成员变量数量
    unsigned int count;
    Ivar *ivarlist = class_copyIvarList([MKPerson class], &count);
    for (int i=0; i<count; i++) {
        Ivar ivar = ivarlist[i];
       NSLog(@"%s,%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    free(ivarlist);
    
}


@end
