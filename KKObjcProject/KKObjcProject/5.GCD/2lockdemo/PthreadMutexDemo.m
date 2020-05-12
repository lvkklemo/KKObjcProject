//
//  PthreadMutexDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "PthreadMutexDemo.h"
#import <pthread.h>


/*
 什么时候使用自旋锁
 1.预计线程等待时间很短
 2.加锁代码经常被调用,竞争情况很少发生
 3.CPU资源不紧张
 */

/*
 互斥锁
 1.预计线程等待时间很长
 2.单核处理器
 3.加锁代码(临界区)有IO操作
 4.临界区竞争激烈
 */
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
