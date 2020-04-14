//
//  Runtime3Controller.m
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/14.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "Runtime3Controller.h"
#import "MJPerson1.h"
#import "MJClassInfo.h"

//objc_msgSend
@interface Runtime3Controller ()

@end

@implementation Runtime3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"objc_msgSend";
    
    MJPerson1*person = [[MJPerson1 alloc] init];
    [person personTest];
    
    /*
     Person*person = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));
     ((void (*)(id, SEL))(void *)objc_msgSend)((id)person, sel_registerName("personTest"));
     */
}

@end
