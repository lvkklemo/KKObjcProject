//
//  LVThreadTool.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/27.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "LVThreadTool.h"

/**InnerThread***/
@interface InnerThread ()
@end
@implementation InnerThread
- (void)dealloc{
    NSLog(@"%s",__func__);
}
@end

/**LVThreadTool***/
@interface LVThreadTool ()
@property(nonatomic,strong) InnerThread * iThread;
@property(nonatomic,assign,getter=isStoped) BOOL stoped;
@end

@implementation LVThreadTool

- (instancetype)init{
    if (self=[super init]) {
        self.stoped = NO;
        __weak typeof(self) weakSelf = self;
        self.iThread = [[InnerThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            while (weakSelf&&!weakSelf.stoped) {
                 [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
           
        }];
        [self.iThread start];
    }
    return self;
}

- (void)run{
    if (!self.iThread) return;
    [self.iThread start];
}
- (void)stop{
    if (!self.iThread) return;
    [self performSelector:@selector(__stop) onThread:self.iThread withObject:nil waitUntilDone:YES];
}
- (void)executeTaskBlock:(TaskBlock)task{
    if (!self.iThread|| !task) return;
    //YES线程阻塞 NO不会线程阻塞
    [self performSelector:@selector(__executeTask:) onThread:self.iThread withObject:task waitUntilDone:NO];
}
- (void)dealloc{
    [self stop];
    NSLog(@"%s",__func__);
}

#pragma mark private
- (void)__stop{
    self.stoped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.iThread = nil;
}

- (void)__executeTask:(TaskBlock)task{
    task();
}
@end
