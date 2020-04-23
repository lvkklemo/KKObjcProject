//
//  KKPerson+Test1.h
//  KKCategoryDemo
//
//  Created by 宇航 on 2020/4/8.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "KKPerson.h"

/*
.1load方法是在main方法执行之前，initialize是在main方法之后，由此我们可以知道load方法中没有什么autorelease runloop。
 5.2load方法适合做一些方法实现的替换。不适合生成一些变量。做很复杂的事情
 5.3initialize方法适合进行一写static变量的初始化
 */
@interface KKPerson (Test1)
@property(nonatomic,assign) int weight;
@end

