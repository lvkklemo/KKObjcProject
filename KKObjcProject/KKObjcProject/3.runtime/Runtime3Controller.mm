//
//  Runtime3Controller.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/14.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime3Controller.h"
#import "MJPerson1.h"
#import "MJClassInfo.h"

/*
 1.OC 的消息机制
 OC中的方法调用其实都是转成了objc_msgSend函数的调用，给receiver（方法调用者）发送了一条消息（selector方法名）
 objc_msgSend底层有3大阶段
 消息发送（当前类、父类中查找）、动态方法解析、消息转发
 */


@interface Runtime3Controller ()

@end

@implementation Runtime3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"objc_msgSend";
    
    MJPerson1*person = [[MJPerson1 alloc] init];
    [person personTest:@"lyf"];
    //[MJPerson1 test];
    /*底层代码
     Person*person = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));
     ((void (*)(id, SEL))(void *)objc_msgSend)((id)person, sel_registerName("personTest"));
     */
}

@end
