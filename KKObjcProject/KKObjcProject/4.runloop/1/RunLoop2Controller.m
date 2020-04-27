//
//  RunLoop2Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/24.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "RunLoop2Controller.h"

@interface RunLoop2Controller ()

@end

@implementation RunLoop2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"NSTimer";
    
    static int count = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%d",count++);
//    }];
    NSTimer*timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d",count++);
    }];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

@end
