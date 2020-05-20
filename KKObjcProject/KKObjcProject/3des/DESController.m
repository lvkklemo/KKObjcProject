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
@property(atomic,copy) NSString * name;
@end

@implementation DESController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * teldes =  [HQDes telePhoneNumber3EDS:@"525" encryptOrDecrypt:kCCEncrypt];
    NSLog(@"%@",teldes);
    
    NSString * tel = [HQDes telePhoneNumber3EDS:teldes encryptOrDecrypt:kCCDecrypt];;
    NSLog(@"%@",tel);
    
    NSString * str1 = [NSString stringWithFormat:@"87"];
    NSString * str2 = [NSString stringWithFormat:@"abcdejasdjsjadjasd"];;
    NSLog(@"%@ %@",[str1 class],[str2 class]);
    
//    dispatch_queue_t quene = dispatch_get_global_queue(0, 0);
//    for (int i=0; i<1000; i++) {
//        dispatch_async(quene, ^{
//            self.name = [NSString stringWithFormat:@"abcasdasdasdsadsadsadsadsad"];
//        });
//    }
    
//
//    dispatch_queue_t quene1 = dispatch_get_global_queue(0, 0);
//    for (int i=0; i<1000; i++) {
//        dispatch_async(quene1, ^{
//            self.name = [NSString stringWithFormat:@"abc"];
//        });
//    }
    
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
