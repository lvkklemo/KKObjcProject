//
//  Runtime2Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/13.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime2Controller.h"
#import "MJGoodStudent.h"
#import "MJClassInfo.h"

@interface Runtime2Controller ()

@end

@implementation Runtime2Controller


/*
 类对象结构
 struct objc_class {
    class isa;
    class superclass;
    cahce_t cache;//方法缓存
    class_data_bits_t bits;//&FAST_DATA_MASK 用于获取具体的类信息
 }
 
 方法缓存:用散列表缓存曾经调用过的方法,可以提高方法的查找速度
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    //SEL 方法名字
//    SEL sel1 = sel_registerName("testRun");
//    SEL sel2 = @selector(testRun);
//    //打印名字
//    NSLog(@"sel1=%s sel2=%s",sel1,sel2);
//    //打印地址
//    NSLog(@"sel1=%p sel2=%p",sel1,sel2);
    /*
     给person对象发送消息
     通过对象isa指针,找到类对象MJPerson1
     对象类列表找对象方法,如果e没有找到
     通过superclass去父类方法列表查找方法
     
     快速查找方法途径:方法缓存
     */
    
    MJGoodStudent *goodStudent = [[MJGoodStudent alloc] init];
    mj_objc_class *goodStudentClass = (__bridge mj_objc_class *)[MJGoodStudent class];
    
    [goodStudent goodStudentTest];
    [goodStudent studentTest];
    [goodStudent personTest:@""];
    [goodStudent goodStudentTest];
    [goodStudent studentTest];
    
    NSLog(@"--------------------------");
    
    cache_t cache = goodStudentClass->cache;
    NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
    NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
    NSLog(@"%s %p", @selector(goodStudentTest), cache.imp(@selector(goodStudentTest)));


    
    bucket_t *buckets = cache._buckets;
    bucket_t bucket = buckets[(long long)@selector(studentTest) & cache._mask];
    NSLog(@"%s %p", bucket._key, bucket._imp);
    
    //IMP获取方法消息指令
    //p (IMP)0x109f36410
    //(IMP) $2 = 0x0000000109f36410 (KKObjcProject`-[MJStudent studentTest] at MJStudent.m:12)
    
    for (int i = 0; i <= cache._mask; i++) {
        bucket_t bucket = buckets[i];
        NSLog(@"%s %p", bucket._key, bucket._imp);
    }

}

@end
