//
//  NSConditionDemo.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/1.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo ()
@property(nonatomic,strong) NSCondition * condition;
@property(nonatomic,strong) NSMutableArray * array;
@end

@implementation NSConditionDemo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
        self.array = [NSMutableArray array];
    }
    return self;
}
- (void)otherTest{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

- (void)__remove{
    [self.condition lock];
    
    if (self.array.count ==0) {
        [self.condition wait];
    }
    NSLog(@"__remove%@",[NSThread currentThread]);
    
    [self.condition  unlock];
}

- (void)__add{
    [self.condition lock];
    NSLog(@"__add%@",[NSThread currentThread]);
    [self.array addObject:@"tesstt"];
    [self.condition signal];
    [self.condition unlock];
}
@end
