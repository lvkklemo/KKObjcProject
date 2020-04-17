//
//  Runtime5Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.
//

/*
 消息机制使用场景
 1.方法没有实现
 2.不可变数组,add:错误
 使用消息机制解决方法找不到的异常,增加稳定性
 */
#import "Runtime5Controller.h"
#import "Person5.h"

@interface Runtime5Controller ()

@end

@implementation Runtime5Controller

//NSProxy
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person5*person = [[Person5 alloc] init];
    [person run];
    [person test];
    [person other];
    
    int age = 9;
    NSLog(@"%p",&age);
}


@end
