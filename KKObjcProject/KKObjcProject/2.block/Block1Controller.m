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

 
 */
@implementation Block1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


@end
