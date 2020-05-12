//
//  NSLockDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/1.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
@property(nonatomic,strong) NSLock * lock_ticket;
@property(nonatomic,strong) NSLock * lock_money;
@end

@implementation NSLockDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lock_ticket = [[NSLock alloc] init];
        self.lock_money = [[NSLock alloc] init];
    }
    return self;
}
- (void)__saleTicket{
    [self.lock_ticket lock];
    [super __saleTicket];
    [self.lock_ticket unlock];
}

- (void)__saveMoney{
    [self.lock_money lock];
    [super __saveMoney];
    [self.lock_money unlock];
}

- (void)__drawMoney{
    [self.lock_money lock];
    [super __drawMoney];
    [self.lock_money unlock];
}

@end
