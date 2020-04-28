//
//  RunLoop5Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/27.
//  Copyright © 2020 tecent. All rights reserved.
//

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
