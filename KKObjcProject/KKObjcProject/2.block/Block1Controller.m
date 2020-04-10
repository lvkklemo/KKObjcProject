//
//  Block1Controller.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/10.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Block1Controller.h"

@interface Block1Controller ()

@end

/*
 oc转换成源码cpp
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
 block本质上也是一个OC对象，它内部也有个isa指针 
 block是封装了函数调用以及函数调用环境的OC对象
 block底层数据如结构体 __main_block_impl_0
 */

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void * FouncPtr;
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0 *Desc;
    int age;
};

@implementation Block1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
  
    int age = 20;
    void(^block)(void) = ^{
        NSLog(@"age is %d",age);
    };
    
    struct __main_block_impl_0 * kblock = (__bridge struct __main_block_impl_0 *)block;
    NSLog(@"%@",kblock);
    block();
    NSLog(@"%@",kblock);
    
    /*
     kblock    __main_block_impl_0 *    0x600000b73d50    0x0000600000b73d50
     impl    __block_impl
     Desc    __main_block_desc_0 *    0x105982080    0x0000000105982080
     age    int    20
     */
}


@end
