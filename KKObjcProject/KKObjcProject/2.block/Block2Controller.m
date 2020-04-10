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
    [self test4];
}

//局部变量 捕获进入block
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

//block的isa和superclass
- (void)test3{
    void(^kblock)(void) = ^{
        NSLog(@"Hello");
    };
    kblock();
    //block是一个对象,有isa指针-->block属于类
    //__NSGlobalBlock__:__NSGlobalBlock:NSBlock:NSObject
    NSLog(@"%@",[kblock class]);
    NSLog(@"%@",[[kblock class] superclass]);
    NSLog(@"%@",[[[kblock class] superclass] superclass]);
    NSLog(@"%@",[[[[kblock class] superclass] superclass] superclass]);
}

//block的类型
- (void)test4{
    
    //__NSGlobalBlock__ 没有访问auto变量 访问static全局变量的 global-block
    void(^block1)(void) = ^{
        NSLog(@"Hello age1");
    };
    
     //__NSStackBlock__ 访问了auto变量
    int age = 20;
    void(^block2)(void) = ^{
        NSLog(@"age2 = %d",age);
    };
    
    NSLog(@"%@,%@,%@",[block1 class],[block2 class],[^{
        NSLog(@"age3 = %d",age);
    } class]);
    
    /*
     __NSGlobalBlock__  数据区域,全局变量
     __NSMallocBlock__  内存堆区和OC对象一起存放  程序动态申请内存 [NSObject alloc] malloc
     __NSStackBlock__   内存栈段  系统自动分配内存, 局部变量
     
     __NSGlobalBlock__ copy   还是 __NSGlobalBlock__
     __NSMallocBlock__ copy   还是 __NSMallocBlock__ block引用计数加1
     __NSStackBlock__  copy   == __NSMallocBlock__
     栈block(访问了auto变量)不安全,随时都可能销毁,使用copy把StackBlock变成MallocBlock,保证数据安全
     */

}

@end
