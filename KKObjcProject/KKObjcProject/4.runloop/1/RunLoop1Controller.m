//
//  RunLoop1Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/23.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "RunLoop1Controller.h"

@interface RunLoop1Controller ()

@end

@implementation RunLoop1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"RunLoop-Model切换";
    //创建observe
    CFRunLoopObserverRef observe = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
            {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry %@",mode);
                CFRelease(mode);
                break;
            }
            case kCFRunLoopExit:
            {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit %@",mode);
                CFRelease(mode);
                break;
            }
            default:
                break;
        }
    });
    
    //添加observe到RunLoopO
    CFRunLoopAddObserver(CFRunLoopGetMain(), observe, kCFRunLoopCommonModes);
    
    //释放
    CFRelease(observe);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
