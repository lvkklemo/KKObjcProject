//
//  GCD1Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/27.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "GCD1Controller.h"

@interface GCD1Controller ()

@end

@implementation GCD1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //异步开启线程 子线程执行任务
    dispatch_queue_t quene = dispatch_get_global_queue(0, 0);
    dispatch_async(quene, ^{
        //NSLog(@"\n线程:%@ \n当前方法:%s",[NSThread currentThread],__func__);
    });
    
    //同步 当前线程执行任务
    dispatch_queue_t quene2 = dispatch_get_global_queue(0, 0);
    dispatch_sync(quene2, ^{
        //NSLog(@"\n线程:%@ \n当前方法:%s",[NSThread currentThread],__func__);
    });
    
    //串行队列
    dispatch_queue_t serialq = dispatch_queue_create("hq", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialq, ^{
        for (int i = 0; i<6; i++) {
            //NSLog(@"\n线程1:%@ \n当前方法:%s",[NSThread currentThread],__func__);
        }
    });
    dispatch_async(serialq, ^{
        for (int i = 0; i<6; i++) {
            //NSLog(@"\n线程2:%@ \n当前方法:%s",[NSThread currentThread],__func__);
        }
    });
    
    [self interview03];
}

- (void)interview01{
    ///以下代码产生了死锁
    NSLog(@"执行任务1");
    ///队列特点:排队FIFO first in first out先进先出
    dispatch_queue_t quene3 = dispatch_get_main_queue();
    dispatch_sync(quene3, ^{
        NSLog(@"执行任务2");
    });
    //dispatch_sync立马在当前线程执行任务
    NSLog(@"执行任务3");
}
- (void)interview02{
    ///以下代码不产生了死锁
    NSLog(@"执行任务1");
    ///队列特点:排队FIFO first in first out先进先出
    dispatch_queue_t quene3 = dispatch_get_main_queue();
    dispatch_async(quene3, ^{
        NSLog(@"执行任务2");
    });
    //dispatch_async 不要求立马在当前线程执行任务
    //还是在主线程,等上一个任务执行完成后执行
    NSLog(@"执行任务3");
}

- (void)interview03{

    //产生了死锁
    NSLog(@"执行任务1");
    dispatch_queue_t quene1 = dispatch_queue_create("myquene1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t quene2 = dispatch_queue_create("myquene2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(quene1, ^{//0
        NSLog(@"执行任务2 %@",[NSThread currentThread]);;
        dispatch_sync(quene2, ^{//1
            NSLog(@"执行任务3 %@",[NSThread currentThread]);
        });
        NSLog(@"执行任务4");
    });
  NSLog(@"执行任务5");
}
@end
