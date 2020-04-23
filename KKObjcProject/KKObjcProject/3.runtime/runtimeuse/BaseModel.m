//
//  BaseModel.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/4/21.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "BaseModel.h"
#import <objc/message.h>

@implementation BaseModel
-(instancetype)initWithDict:(NSDictionary*)dict{
    self = [super init];
    if (self) {
        for (NSString *key in dict.allKeys) {
            //1.创建一个set选择器
            NSString *methodName = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
            SEL selector = NSSelectorFromString(methodName);
            
            //2.set参数
            id value = dict[key];
            if([value isKindOfClass:[NSNull class]]) continue;
            
            //3.发送消息
            if (!selector) continue;
            ((void (*)(id, SEL, id))objc_msgSend)(self, selector, value);
        }
    }
    return self;
}
-(NSDictionary*)convertModelToDict{
    
    NSMutableDictionary*dict = [NSMutableDictionary dictionary];
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i=0; i<count; i++) {
        objc_property_t property = properties[i];
        //属性名称
        const char * name = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        
        //1.创建一个get选择器
        SEL selector = NSSelectorFromString(propertyName);
        //发送消息
        if (!selector) continue;
        id value = ((id (*)(id, SEL))objc_msgSend)(self, selector);
        //空与类型异常处理
        if(!value || [value isKindOfClass:[NSNull class]]) continue;
        //3值存储
        [dict setObject:value forKey:propertyName];
    }
    //copy创建的需要释放
    free(properties);
    return dict;
}
@end
