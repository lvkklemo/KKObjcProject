//
//  GCD3Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "GCD3Controller.h"
#import "OSSponLockDemo.h"
#import "OSFairLockDemo.h"
#import "PthreadMutexDemo.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"

@interface GCD3Controller ()

//@property (assign, nonatomic) OSSpinLock lock_snip2;
@end

@implementation GCD3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test5];
}

- (void)test1{
    LVLockBase * lockBase = [[OSSponLockDemo alloc] init];
    [lockBase ticketTest];
    [lockBase moneyTest];
}

- (void)test2{
    LVLockBase * lockBase = [[OSFairLockDemo alloc] init];
    [lockBase ticketTest];
    //[lockBase moneyTest];
}

- (void)test3{
    LVLockBase * lockBase = [[PthreadMutexDemo alloc] init];
    //[lockBase ticketTest];
    [lockBase moneyTest];
}

//NSLockDemo
- (void)test4{
    LVLockBase * lockBase = [[NSLockDemo alloc] init];
    [lockBase ticketTest];
    //[lockBase moneyTest];
}

- (void)test5{
    NSConditionDemo * lockBase = [[NSConditionDemo alloc] init];
    [lockBase otherTest];
}
@end

