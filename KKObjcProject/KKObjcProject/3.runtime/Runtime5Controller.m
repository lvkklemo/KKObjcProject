//
//  Runtime5Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.
//

/*
 消息机制使用场景
 1.方法没有实现
 2.不可变数组,add:错误
 使用机制解决方法找不到的异消息常,增加稳定性
 3.class
 4.super
 */
#import "Runtime5Controller.h"
#import "Person5.h"
#import "MJPerson1.h"
#import "MJStudent.h"
#import "objc/runtime.h"

@interface Runtime5Controller ()

@end

@implementation Runtime5Controller

//NSProxy
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person5*person = [[Person5 alloc] init];
    [person run];
    [person test];
    [person other];
    
    //第三方框架,或者其它模块返回的array
    NSMutableArray*array = @[@1,@3];
    //[array addObject:@12];
    
    NSMutableArray * array2 = [NSMutableArray array];
    //[array2 objectAtIndex:2];
    [self test2];
    
    /*lldv
     打印地址值
     p/x obj
     x查看内存
     x 0x0007f24ea123
     
     x/4g $0
     p (Class)0x0007f24ea123
     */
}

//122
- (void) test2{
    
    //-isMemberOfClass判断obj是不是传进去MJPerson1对象
    //-isKindOfClass  判断obj是不是左边MJPerson1类型/或者NSObject父类类型
    id obj = [[MJPerson1 alloc] init];
    NSLog(@"%d",[obj isMemberOfClass:[MJPerson1 class]]); //1
    NSLog(@"%d",[obj isKindOfClass:[MJPerson1 class]]);//1
    NSLog(@"%d",[obj isMemberOfClass:[NSObject class]]); //0
    NSLog(@"%d",[obj isKindOfClass:[NSObject class]]);//1
    NSLog(@"-----------------");
   
    //+isMemberOfClass  左边类对象的isa指针  等于  左边类对象的原类对象
    //+isKindOfClass    左边类对象的isa指针  等于  左边类对象的原类对象,或者父类的原类
    NSLog(@"%d",[MJPerson1 isMemberOfClass:[MJPerson1 class]]);//0
    NSLog(@"%d",[MJPerson1 isKindOfClass:[MJPerson1 class]]);//0
    NSLog(@"%d",[MJPerson1 isMemberOfClass:object_getClass([MJPerson1 class])]);//1
    NSLog(@"%d",[MJPerson1 isKindOfClass:object_getClass([MJPerson1 class])]);//1
    
    NSLog(@"-----------------");
    NSLog(@"%d",[[NSObject class] isMemberOfClass:[NSObject class]]);
    NSLog(@"%d",[[NSObject class] isKindOfClass:[NSObject class]]);//左边的父类的原类,原类的isa指向了NSObject
    
    NSLog(@"%d",[[MJPerson1 class] isMemberOfClass:[MJPerson1 class]]);
    NSLog(@"%d",[[MJPerson1 class] isKindOfClass:[MJPerson1 class]]);
 
    MJStudent * student = [[MJStudent alloc] init];
    
}


@end
