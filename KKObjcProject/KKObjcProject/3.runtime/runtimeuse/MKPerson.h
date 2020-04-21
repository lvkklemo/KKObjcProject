//
//  MKPerson.h
//  KKObjcProject
//
//  Created by yuhanglv on 2020/4/17.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKPerson : NSObject
@property(nonatomic,assign) int age;
@property(nonatomic,copy) NSString * name;
- (void)run;
- (void)test;
@end

NS_ASSUME_NONNULL_END
