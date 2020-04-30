//
//  OSFairLockDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "OSFairLockDemo.h"

@interface OSFairLockDemo ()
@property(assign,nonatomic) os_unfair_lock lock_ticket;
@property(assign,nonatomic) os_unfair_lock lock_money;
@end

@implementation OSFairLockDemo
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock_ticket = OS_UNFAIR_LOCK_INIT;
        self.lock_money = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}
- (void)__saleTicket{
    os_unfair_lock_lock(&_lock_ticket);
    [super __saleTicket];
    os_unfair_lock_unlock(&_lock_ticket);
}

- (void)__saveMoney{
    os_unfair_lock_lock(&_lock_money);
    [super __saveMoney];
    os_unfair_lock_unlock(&_lock_money);
}

- (void)__drawMoney{
    os_unfair_lock_lock(&_lock_money);
    [super __drawMoney];
    os_unfair_lock_unlock(&_lock_money);
}
@end
