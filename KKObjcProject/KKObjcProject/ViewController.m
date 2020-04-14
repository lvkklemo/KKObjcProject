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
//#import "Block3Controller.h"
#import "Runtime1Controller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    [self test01];
}

- (void)test01{
    
    Runtime1Controller * vc =[[Runtime1Controller alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
