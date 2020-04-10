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

int age_= 10;
static int height_= 11;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

//局部变量 捕获变量
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

//全局变量 block直接根据age_,height_访问,不用捕获进入block
- (void)test2{
    void(^block)(void) = ^{
        NSLog(@"age_ = %d,height_ = %d",age_,height_);
    };
    age_ = 20;
    height_=21;
    block();
    //age_ = 20,height = 21
}

@end
