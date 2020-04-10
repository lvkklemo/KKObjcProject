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

- (void)setWeight:(int)weight{
    objc_setAssociatedObject(self, @selector(weight), @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (int)weight{
    
    //隐式参数
    //_cmd = @selector(weight);
    int weight_ = [objc_getAssociatedObject(self, _cmd) intValue];
    return weight_;
}

//const void * kweightKey = &kweightKey;
//
//- (void)setWeight:(int)weight{
//    objc_setAssociatedObject(self, kweightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (int)weight{
//    int weight_ = [objc_getAssociatedObject(self, kweightKey) intValue];
//    return weight_;
//}

@end
