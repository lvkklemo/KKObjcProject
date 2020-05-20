//
//  CopyController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/14.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "CopyController.h"

@interface CopyController ()

@end

@implementation CopyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"COPY";
    [self test02];
    
    _objc_autoreleasePoolPrint();
}

- (void)test01{
    NSArray * array1 = [[NSArray alloc] initWithObjects:@"a",@"b", nil];
    NSArray * array2 = [array1 copy]; //浅拷贝 地址 不开辟内存
    NSMutableArray* array3 = [array1 mutableCopy];//深拷贝 开辟内存
    
    NSLog(@"%p %p %p",array1,array2,array3);
}

- (void)test02{
    NSMutableArray * array1 = [[NSMutableArray alloc] initWithObjects:@"a",@"b", nil];
    NSArray * array2 = [array1 copy]; //深拷贝 开辟内存
    NSMutableArray* array3 = [array1 mutableCopy];//深拷贝 开辟内存
    
    NSLog(@"%p %p %p",array1,array2,array3);
}
@end
