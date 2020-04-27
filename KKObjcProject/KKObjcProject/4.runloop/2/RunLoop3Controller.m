//
//  RunLoop3Controller.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/26.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "RunLoop3Controller.h"
#import "RunLoop4Controller.h"
//RunLoop线程保活的测试
@interface RunLoop3Controller ()

@end

@implementation RunLoop3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    RunLoop4Controller * vc = [[RunLoop4Controller alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
