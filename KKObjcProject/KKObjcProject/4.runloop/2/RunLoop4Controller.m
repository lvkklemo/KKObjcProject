//
//  RunLoop4Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/26.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "RunLoop4Controller.h"
#import "LVThread.h"
@interface RunLoop4Controller ()
@property(nonatomic,strong) LVThread * lvThread;
@property(nonatomic,assign,getter=isStoped) BOOL stoped;
@end

@implementation RunLoop4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.stoped = NO;
    
    __weak typeof(self) weakself = self;
    self.lvThread = [[LVThread alloc] initWithBlock:^{
        NSLog(@"%@----begin---",[NSThread currentThread]);
        //线程保活
        //在runloop里添加Source\Timer\Observer
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
        while (weakself&&!weakself.isStoped) {
              [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
      
        NSLog(@"%@----end---",[NSThread currentThread]);
    }];
    [self.lvThread start];
}

///在子线程,执行任务
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!self.lvThread) return;
    [self performSelector:@selector(test) onThread:self.lvThread withObject:nil waitUntilDone:NO];
}
- (void)test{
    NSLog(@"当前线程%@ 当前方法%s",[NSThread currentThread],__func__);
}
- (IBAction)stopAction:(id)sender {
    if (!self.lvThread) return;
    //waitUntilDone:YES子线程执行完毕,这个方法会f往下走
    [self performSelector:@selector(stop) onThread:self.lvThread withObject:nil waitUntilDone:YES];
}

///用于停止子线程的RunLoop
- (void)stop{
    //设置标记NO
    self.stoped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSLog(@"当前线程%@ 当前方法%s",[NSThread currentThread],__func__);
    self.lvThread = nil;
    
}
- (void)dealloc{
    [self stopAction:nil];
    NSLog(@"当前线程%@ 当前方法%s",[NSThread currentThread],__func__);
  
}

@end
