//
//  KKPerson+Test1.h
//  KKCategoryDemo
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "KKPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKPerson (Test1)
@property(nonatomic,assign) int age;
//分类添加属性,只会增添成f属性声明,不会y添加成员变量,和方法实现
//- (void)setAge:(int)age;
//- (int)age;
@end

NS_ASSUME_NONNULL_END
