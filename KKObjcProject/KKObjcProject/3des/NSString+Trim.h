//
//  NSString+Trim.h
//  CommonUtility
//
//  Created by liusanchun on 14-7-25.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Trim)

/**
 *  去除字符串的前后空格
 *
 *  @return 字符串
 */
- (NSString*)trim;


/**
 *  MD5
 */
- (NSString *)md5;
/**
 *  MD5Base64
 */
- (NSString *)MD5Base64String;

/**
 *  字符串 转换 NSNumber
 */
- (NSNumber *)stringToNSNumberWith:(NSString*)string;

- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字
- (CGFloat)stringWidthWithFont:(UIFont *)font height:(CGFloat)height;
@end
