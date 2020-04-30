//
//  LVLockBase.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/30.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<libkern/OSAtomic.h>
#import <os/lock.h>


@interface LVLockBase : NSObject
/**
 卖票演示
 */
- (void)ticketTest;
/**
 卖1张票
 */
- (void)__saleTicket;

#pragma mark 子类使用
/**
 存钱、取钱演示
 */
- (void)moneyTest;

/**
 存钱
 */
- (void)__saveMoney;

/**
 取钱
 */
- (void)__drawMoney;

@end

