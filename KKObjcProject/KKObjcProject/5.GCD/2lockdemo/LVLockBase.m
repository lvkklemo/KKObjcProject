//
//  LVLockBase.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "LVLockBase.h"

@interface LVLockBase ()
@property (assign, nonatomic) int ticketsCount;
@property (assign, nonatomic) int money;

@end

@implementation LVLockBase

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

/**
 卖票演示
 */
- (void)ticketTest
{
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
}
/**
 卖1张票
 */
- (void)__saleTicket
{
    
    //加锁
    // OSSpinLockLock(&_lock_snip);
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩%d张票 - %@", oldTicketsCount, [NSThread currentThread]);
    
    //解锁
    //OSSpinLockUnlock(&_lock_snip);
}

/**
 存钱、取钱演示
 */
- (void)moneyTest
{
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //+500
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    
    //-200
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
    
}

/**
 存钱
 */
- (void)__saveMoney
{
    //OSSpinLockLock(&_lock_snip1);
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    //解锁
    //OSSpinLockUnlock(&_lock_snip1);
}

/**
 取钱
 */
- (void)__drawMoney
{
    //OSSpinLockLock(&_lock_snip1);
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    //解锁
    //OSSpinLockUnlock(&_lock_snip1);
}


@end
