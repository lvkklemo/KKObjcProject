//
//  KKPerson.m
//  KKCategoryDemo
//
//  Created by 宇航 on 2020/4/6.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "KKPerson.h"

@implementation KKPerson

+ (void)load{
   // NSLog(@"KKPerson--load");
}
+ (void)initialize{
    //NSLog(@"KKPerson--initialize");
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}
@end
