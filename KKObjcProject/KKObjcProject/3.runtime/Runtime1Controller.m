//
//  Runtime1Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/13.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime1Controller.h"
#import "MJPerson.h"
#import "objc/runtime.h"

typedef enum{
    MJOPtionOne = 1 << 0, //0b0001
    MJOPtionTwo = 1 << 1, //0b0010
    MJOPtionThree = 1 << 2,//0b0100
    MJOPtionFour = 1 << 3//0b1000
}MJOPtions;

@interface Runtime1Controller ()

@end

@implementation Runtime1Controller

- (void)setOptions:(MJOPtions)option{
    if (option&MJOPtionOne) {
        NSLog(@"包含了MJOPtionOne");
    }
    if (option&MJOPtionTwo) {
        NSLog(@"包含了MJOPtionTwo");
    }
    if (option&MJOPtionThree) {
       NSLog(@"包含了MJOPtionThree");
    }
    if (option&MJOPtionFour) {
        NSLog(@"包含了MJOPtionFour");
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"runtime";
    
    MJPerson * person = [[MJPerson alloc] init];
   //类对象
    //NSLog(@"%p",[MJPerson class]);
    //元类对象
    //NSLog(@"%p",object_getClass([MJPerson class]));
    
    [self setOptions:MJOPtionOne|MJOPtionFour];
}


@end
