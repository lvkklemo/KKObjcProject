//
//  DESController.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/12.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "DESController.h"
#import "HQDes.h"
@interface DESController ()

@end

@implementation DESController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * teldes =  [HQDes telePhoneNumber3EDS:@"525" encryptOrDecrypt:kCCEncrypt];
    NSLog(@"%@",teldes);
    
    NSString * tel = [HQDes telePhoneNumber3EDS:teldes encryptOrDecrypt:kCCDecrypt];;
    NSLog(@"%@",tel);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
