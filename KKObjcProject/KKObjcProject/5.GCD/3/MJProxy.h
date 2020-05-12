//
//  MJProxy.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/7.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MJProxy : NSProxy
+(instancetype)proxyWithTarget:(id)target;
@property(nonatomic,weak) id target;
@end

