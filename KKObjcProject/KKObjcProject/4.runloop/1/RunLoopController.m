//
//  RunLoopController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/21.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "RunLoopController.h"

//runloop对象
//源码: https://opensource.apple.com/
//https://opensource.apple.com/tarballs/CF
@interface RunLoopController ()

@end

@implementation RunLoopController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    NSLog(@"%p %p",[NSRunLoop currentRunLoop],[NSRunLoop mainRunLoop]);
//    NSLog(@"%p %p",CFRunLoopGetCurrent(),CFRunLoopGetMain());
    self.title = @"RunLoop";
    //创建observe
    CFRunLoopObserverRef observe = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"kCFRunLoopEntry");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"kCFRunLoopBeforeTimers");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"kCFRunLoopBeforeSources");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"kCFRunLoopBeforeWaiting");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"kCFRunLoopAfterWaiting");
                break;
            case kCFRunLoopExit:
                NSLog(@"kCFRunLoopExit");
                break;
            default:
                break;
        }
    });
    
    //添加observe到RunLoopO
    CFRunLoopAddObserver(CFRunLoopGetMain(), observe, kCFRunLoopCommonModes);
    
    //释放
    CFRelease(observe);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end
