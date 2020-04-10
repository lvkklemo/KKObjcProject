//
//  ViewController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "ViewController.h"
//#import "KKPerson.h"
//#import "KKPerson+Test1.h"
#import "Block2Controller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    KKPerson*person = [[KKPerson alloc] init];
//    person.weight = 20;
//    NSLog(@"%d",person.weight);
    [self test01];
}

- (void)test01{
    Block2Controller * block1 =[[Block2Controller alloc] init];
    [self presentViewController:block1 animated:YES completion:nil];
}


@end
