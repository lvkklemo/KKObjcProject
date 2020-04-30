//
//  GCD2Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/28.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "GCD2Controller.h"
//group队列组
@interface GCD2Controller ()
@end

@implementation GCD2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
}

//GCD队列组
//线程依赖
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建队列组
    dispatch_group_t group = dispatch_group_create();
    //创建并发队列
    dispatch_queue_t quene = dispatch_queue_create("myq", DISPATCH_QUEUE_CONCURRENT);
    //添加异步任务
    dispatch_group_async(group, quene, ^{
        NSLog(@"任务1 %@",[NSThread currentThread]);
    });
    //添加异步任务
    dispatch_group_async(group, quene, ^{
        NSLog(@"任务2 %@",[NSThread currentThread]);
    });
    
    //得到全面任务执行完,会自动回到主线程执行这个任务
//    dispatch_group_notify(group, quene, ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"任务3 %@",[NSThread currentThread]);
//        });
//    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"任务3 %@",[NSThread currentThread]);
    });
}


@end
