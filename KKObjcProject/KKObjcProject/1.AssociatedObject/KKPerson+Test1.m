//
//  KKPerson+Test1.m
//  KKCategoryDemo
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "KKPerson+Test1.h"
#import "objc/runtime.h"

@implementation KKPerson (Test1)

const void * kweightKey = &kweightKey;

- (void)setWeight:(int)weight{
    objc_setAssociatedObject(self, kweightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (int)weight{
    int weight_ = [objc_getAssociatedObject(self, kweightKey) intValue];
    return weight_;
}
@end
