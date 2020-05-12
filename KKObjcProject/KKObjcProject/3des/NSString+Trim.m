//
//  NSString+Trim.m
//  CommonUtility
//
//  Created by liusanchun on 14-7-25.
//  Copyright (c) 2014年 liusanchun. All rights reserved.
//

#import "NSString+Trim.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"

@implementation NSString (Trim)

/**
 *  去除字符串的前后空格
 *
 *  @return 字符串
 */
- (NSString*)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
- (NSString *)MD5Base64String

{
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5([[self dataUsingEncoding:NSUTF8StringEncoding] bytes], (CC_LONG)[self length], result);
    
    NSData *data = [NSData dataWithBytes:result length:CC_MD5_DIGEST_LENGTH];
    
    data = [GTMBase64 encodeData:data];
    
    NSString * base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return base64String;
    
}

- (NSNumber *)stringToNSNumberWith:(NSString*)string{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    NSNumber *numTemp = [numberFormatter numberFromString:string];
    
    return numTemp;
}


- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

- (BOOL)includeChinese
{
    for(int i=0; i< [self length];i++)
    {
        int a =[self characterAtIndex:i];
        if( a >0x4e00&& a <0x9fff){
            return YES;
        }
    }
    return NO;
}

- (CGFloat)stringWidthWithFont:(UIFont *)font height:(CGFloat)height {
    if (self == nil || self.length == 0) {
        return 0;
    }
    
    NSString *copyString = [NSString stringWithFormat:@"%@", self];
    
    CGSize constrainedSize = CGSizeMake(999999, height);
    
    NSDictionary * attribute = @{NSFontAttributeName:font};
    CGSize size = [copyString boundingRectWithSize:constrainedSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return ceilf(size.width);
}

@end
