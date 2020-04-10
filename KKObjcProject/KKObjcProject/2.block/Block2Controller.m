//
//  Block2Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/10.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Block2Controller.h"

@interface Block2Controller ()

@end

@implementation Block2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
}

- (void)test1{
    
    //值传递 默认auto 自动变量 只修饰局部变量
    auto int age = 10;
    //height j静态局部变量 static变量
    static int height = 11;
    
    void(^block)(void) = ^{
        //age的值捕获进来
        //height的指针捕获进来
        NSLog(@"age = %d,height = %d",age,height);
    };
    age = 20;
    height=21;
    block();
}

@end
