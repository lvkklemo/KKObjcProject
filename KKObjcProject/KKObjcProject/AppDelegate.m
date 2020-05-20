//
//  AppDelegate.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "AppDelegate.h"
#import "GCD3Controller.h"
#import "DispatchSemaphoreVC.h"
#import "AutomicVC.h"
#import "TimerController.h"
#import "DESController.h"
#import "CopyController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//https://opensource.apple.com/tarballs/objc4/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    CopyController*vc = [[CopyController alloc] init];
    UINavigationController*nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end


/*
 //查看汇编 Product --Perform Action -- Assemble
 //断点 Debug DebugWorkflow Always Show Disassemly
 //转换为cpp  xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
 
 //生成中间代码 clang -emit-llvm -S Person6.m
 */

/*
 实现一个常驻线程
 为当前线程开启一个RunLoop
 向该RunLoop中添加一个Port/Source等维持RunLoop的事件循环
 启动该RunLoop
 */


/*多线程访问资源 加锁
 1.OSSpinLock
 !! dispatch_semaphore_t信号量控制最大并发数,和实现线程同步技术
 */


/*
 190多线程读写安全
 */
