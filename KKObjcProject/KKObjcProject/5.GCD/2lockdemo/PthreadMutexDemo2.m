//
//  PthreadMutexDemo2.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "PthreadMutexDemo2.h"

#import <pthread.h>
@interface PthreadMutexDemo2 ()
@property(assign,nonatomic) pthread_mutex_t lock_ticket;
@end

@implementation PthreadMutexDemo2

- (void)__initMutex:(pthread_mutex_t *)mutex{
    ///初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    ///初始化锁
    pthread_mutex_init(mutex, &attr);
    ///销毁属性
    pthread_mutexattr_destroy(&attr);
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initMutex:&_lock_ticket];
    
    }
    return self;
}


- (void)dealloc{
    pthread_mutex_destroy(&_lock_ticket);
  
}
@end

