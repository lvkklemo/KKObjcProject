//
//  ViewController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "ViewController.h"
#import "KKPerson.h"
#import "KKPerson+Test1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    KKPerson*person = [[KKPerson alloc] init];
    person.weight = 20;
    NSLog(@"%d",person.weight);
}

- (void)test01{
    
}


@end
