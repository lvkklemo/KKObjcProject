//
//  Runtime6Controller.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/17.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime6Controller.h"
#import "Person6.h"

@interface Runtime6Controller ()

@end

@implementation Runtime6Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person6 *person6 =[[Person6 alloc] init];
    [person6 run];
}


@end
