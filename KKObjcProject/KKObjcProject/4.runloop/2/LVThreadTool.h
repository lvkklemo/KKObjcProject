//
//  LVThreadTool.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/27.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InnerThread : NSThread

@end

typedef void(^TaskBlock)(void);
@interface LVThreadTool : NSObject
/*
 *开启一个线程
 */
- (void)run;
/*
 *结束一个线程
 */
- (void)stop;

/*
 *当前子线程执行一个任务
 */
- (void)executeTaskBlock:(TaskBlock)task;
@end

