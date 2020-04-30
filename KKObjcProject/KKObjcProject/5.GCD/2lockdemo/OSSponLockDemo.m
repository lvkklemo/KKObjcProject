//
//  OSSponLockDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "OSSponLockDemo.h"
#import<libkern/OSAtomic.h>

@interface OSSponLockDemo ()
//@property (assign, nonatomic) OSSpinLock lock_ticket;
@property (assign, nonatomic) OSSpinLock lock_money;
@end

@implementation OSSponLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        //初始化锁
        self.lock_money = OS_SPINLOCK_INIT;
    }
    return self;
}
- (void)__saleTicket{
    //static 变量 静态初始化
    static OSSpinLock lock_ticket = OS_SPINLOCK_INIT;
    OSSpinLockLock(&lock_ticket);
    [super __saleTicket];
    OSSpinLockUnlock(&lock_ticket);
}

- (void)__saveMoney{
    OSSpinLockLock(&_lock_money);
    [super __saveMoney];
    OSSpinLockUnlock(&_lock_money);
}

- (void)__drawMoney{
    OSSpinLockLock(&_lock_money);
    [super __drawMoney];
    OSSpinLockUnlock(&_lock_money);
}
@end
