//
//  Runtime4Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/15.
//  Copyright © 2020 tecent. All rights reserved.

/*
 synthesize和@dynamic
*/

#import "Runtime4Controller.h"
#import "MJPerson4.h"

@interface Runtime4Controller ()

@end

@implementation Runtime4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MJPerson4*person= [[MJPerson4 alloc] init];
    person.age = 20;
    NSLog(@"%d",person.age);
}

@end
