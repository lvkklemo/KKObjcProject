//
//  Person6.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/17.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Person6.h"

//LLVM
//OC--> 中间代码(.ll) --> 汇编/机器码
@implementation Person6

void test(int param){
    
}

//- (void)run{
//    NSLog(@"%s",__func__);
//}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if (aSelector == @selector(run)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    int a = 1;
    int b = 4;
    int c = a+b;
    test(c);
    //查看汇编 Product --Perform Action -- Assemble
    //断点 Debug DebugWorkflow Always Show Disassemly
    //转换为cpp  xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
    
    //生成中间代码 clang -emit-llvm -S Person6.m

}
@end
