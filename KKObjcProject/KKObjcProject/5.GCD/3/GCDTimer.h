//
//  GCDTimer.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/7.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GCDTimer : NSObject
+(NSString*)execTask:(void(^)(void))task
          start:(NSTimeInterval) start
       interval:(NSTimeInterval)interval
        repeats:(BOOL)repeats
          async:(BOOL)async;

+ (NSString *)execTask:(id)target
              selector:(SEL)selector
                 start:(NSTimeInterval)start
              interval:(NSTimeInterval)interval
               repeats:(BOOL)repeats
                 async:(BOOL)async;

+ (void)cancelTask:(NSString *)name;

@end

