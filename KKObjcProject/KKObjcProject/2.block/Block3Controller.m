//
//  Block3Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/12.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Block3Controller.h"
#import "MJPerson.h"

/*
 block内存管理
 */
@interface Block3Controller ()

@end

@implementation Block3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self test2];
}

//循环引用
//两个强引用导致不能释放
- (void)test1{
    MJPerson*person = [[MJPerson alloc] init];
    person.age = 10;
    person.mBlock = ^{
        NSLog(@"%d",person.age);
    };
    person.mBlock();
    NSLog(@"11111111");
}

//解决循环引用
- (void)test2{
    MJPerson*person = [[MJPerson alloc] init];
    person.age = 10;
//    __weak MJPerson*weakperson = person;
    __weak typeof(person) weakperson = person;
    person.mBlock = ^{
        NSLog(@"%d",weakperson.age);
    };
    person.mBlock();
    NSLog(@"11111111");
}

//解决循环引用
- (void)test3{
    __block MJPerson*person = [[MJPerson alloc] init];
    person.age = 10;
    person.mBlock = ^{
        NSLog(@"%d",person.age);
        person=nil;
    };
    person.mBlock();
    NSLog(@"11111111");
}
@end
