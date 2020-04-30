//
//  PthreadMutexDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "PthreadMutexDemo.h"
#import <pthread.h>
@interface PthreadMutexDemo ()
@property(assign,nonatomic) pthread_mutex_t lock_ticket;
@property(assign,nonatomic) pthread_mutex_t lock_money;
@end

@implementation PthreadMutexDemo

- (void)__initMutex:(pthread_mutex_t *)mutex{
//    ///初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//    ///初始化锁
//    pthread_mutex_init(mutex, &attr);
//    ///销毁属性
//    pthread_mutexattr_destroy(&attr);
    
    pthread_mutex_init(mutex, NULL);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __initMutex:&_lock_ticket];
        [self __initMutex:&_lock_money];
    }
    return self;
}

- (void)__saleTicket{
    pthread_mutex_lock(&_lock_ticket);
    [super __saleTicket];
    pthread_mutex_unlock(&_lock_ticket);
}

- (void)__saveMoney{
    pthread_mutex_lock(&_lock_money);
    [super __saveMoney];
    pthread_mutex_unlock(&_lock_money);
}

- (void)__drawMoney{
    pthread_mutex_lock(&_lock_money);
    [super __drawMoney];
    pthread_mutex_unlock(&_lock_money);
}

- (void)dealloc{
    pthread_mutex_destroy(&_lock_ticket);
    pthread_mutex_destroy(&_lock_money);
}
@end
