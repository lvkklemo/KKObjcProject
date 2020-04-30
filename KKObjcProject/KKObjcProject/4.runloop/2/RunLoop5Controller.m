//
//  RunLoop5Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/27.
//  Copyright © 2020 tecent. All rights reserved.

/*
实现一个常驻线程
为当前线程开启一个RunLoop
向该RunLoop中添加一个Port/Source等维持RunLoop的事件循环
启动该RunLoop
*/

#import "RunLoop5Controller.h"
#import "LVThreadTool.h"
@interface RunLoop5Controller ()
@property(nonatomic,strong)LVThreadTool * myt;
@end

@implementation RunLoop5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.myt = [[LVThreadTool alloc] init];
    //[self.myt run];
 
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.myt executeTaskBlock:^{
        NSLog(@"\n执行任务:\n--线程:%@\n--方法:%s",[NSThread currentThread],__func__);
    }];
}

- (void)dealloc{
    NSLog(@"%s",__func__);
    //[self.myt stop];
}
@end
