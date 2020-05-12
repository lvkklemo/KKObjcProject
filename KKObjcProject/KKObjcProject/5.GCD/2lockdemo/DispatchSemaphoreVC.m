//
//  DispatchSemaphoreVC.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/6.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "DispatchSemaphoreVC.h"

#define kSemaphoreBegin \
static dispatch_semaphore_t semaphore;\
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
    semaphore = dispatch_semaphore_create(1); \
}); \
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define kSemaphoreEnd \
 dispatch_semaphore_signal(semaphore);

@interface DispatchSemaphoreVC ()
@property(nonatomic,strong) dispatch_semaphore_t semaphore_t;
@end

@implementation DispatchSemaphoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.semaphore_t = dispatch_semaphore_create(5);
    //[self otherTest];
    [self testOperation];
}
- (void)otherTest{
    for (int i =0; i<20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
  
}
- (void)test{
    
    dispatch_semaphore_wait(self.semaphore_t, DISPATCH_TIME_FOREVER);
    sleep(2);
    NSLog(@"test:%@",[NSThread currentThread]);
    dispatch_semaphore_signal(self.semaphore_t);
}

- (void)semaphoreTest1{
    static dispatch_semaphore_t semaphore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        semaphore = dispatch_semaphore_create(1);
    });
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //........
    dispatch_semaphore_signal(semaphore);
}
- (void)semaphoreTest2{
    kSemaphoreBegin
    //........
    kSemaphoreEnd
}

- (void)testOperation{
    // 1.封装操作
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil];
    //    operation1.queuePriority = NSOperationQueuePriorityHigh
        
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run) object:nil];
        
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i<10; i++) {
            NSLog(@"NSBlockOperation------下载图片---%@", [NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.1];
        }
    }];
    
    // 2.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 2; // 2 ~ 3为宜
        
    // 通过设置依赖来确定operation执行的顺序
    [operation2 addDependency:operation3];
    [operation3 addDependency:operation1];
        
    // 3.添加操作到队列中(自动执行操作, 自动开启线程)
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
        
    [queue addOperationWithBlock:^{
        NSLog(@"NSBlockOperation------下载图片3---%@", [NSThread currentThread]);
    }];
    
    //[queue setSuspended:YES];
}

- (void)download{
    NSLog(@"%s,%@",__func__,[NSThread currentThread]);
}
- (void)run{
    NSLog(@"%s,%@",__func__,[NSThread currentThread]);
}
@end
