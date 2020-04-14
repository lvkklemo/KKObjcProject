//
//  MJPerson.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/12.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MJBlock)(void);
@interface MJPerson : NSObject
@property(nonatomic,copy)MJBlock mBlock;
@property(nonatomic,assign)int age;
@end

