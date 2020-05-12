//
//  TimerController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/7.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "TimerController.h"
#import "LVProxy.h"
#import "MJProxy.h"
#import "GCDTimer.h"

@interface TimerController ()
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)CADisplayLink * link;
@property(nonatomic,strong)dispatch_source_t gcdtimer;
@property(nonatomic,copy)NSString * tname ;
@end

@implementation TimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //保证频率和屏幕刷帧频率一致,60FPS
    //self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(test)];
    //[self.link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //循环引用问题
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    
    //无循环引用,ios10later
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf test];
//    }];
    //解决循环引用
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[LVProxy proxyWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    
    //self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[MJProxy proxyWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    //解决不准时 https://www.jianshu.com/p/e4f379b82953
   // self.timer = [NSTimer timerWithTimeInterval:1.0 target:[MJProxy proxyWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    //[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //GCD定时器
//    //队列
//    //主线程
//    //dispatch_queue_t quene = dispatch_get_main_queue();
//    ///子线程
//    dispatch_queue_t quene = dispatch_queue_create("ktimer", DISPATCH_QUEUE_SERIAL);
//    //创建定时器
//    self.gcdtimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
//    //设置时间
//    //timer 开始时间 时间间隔 误差
//    dispatch_source_set_timer(self.gcdtimer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 );
//    //设置回调
////    dispatch_source_set_event_handler(self.gcdtimer, ^{
////        //code to be executed when timer fires
////        NSLog(@"111222");
////    });
//    dispatch_source_set_event_handler_f(self.gcdtimer, timerFire);
//    //启动定时器
//    dispatch_resume(self.gcdtimer);
    
    //[self gcd_timer_test];
    
    //gcd封装
    NSLog(@"begin");
    self.tname = [GCDTimer execTask:^{
        NSLog(@"221100");
    } start:2.0 interval:1.0 repeats:YES async:YES];
    NSLog(@"%@",self.tname);

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [GCDTimer cancelTask:self.tname];
}

- (void)test{
    NSLog(@"%s",__func__);
}

- (void)gcd_timer_test
{
    
    // 队列
    //    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_queue_t queue = dispatch_queue_create("timer", DISPATCH_QUEUE_SERIAL);
    
    // 创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置时间
    uint64_t start = 2.0; // 2秒后开始执行
    uint64_t interval = 1.0; // 每隔1秒执行
    dispatch_source_set_timer(timer,
                              dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC),
                              interval * NSEC_PER_SEC, 0);
    
    // 设置回调
    //    dispatch_source_set_event_handler(timer, ^{
    //        NSLog(@"1111");
    //    });
    dispatch_source_set_event_handler_f(timer, timerFire);
    
    // 启动定时器
    dispatch_resume(timer);
    
    self.gcdtimer = timer;
}

void timerFire(void *param){
    NSLog(@"2222 - %@", [NSThread currentThread]);
}

- (void)dealloc{
    NSLog(@"%s",__func__);
    //[self.timer invalidate];
    //[self.timer invalidate];
    [GCDTimer cancelTask:self.tname];
}

@end
