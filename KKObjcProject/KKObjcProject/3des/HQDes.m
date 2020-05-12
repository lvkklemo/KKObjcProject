//
//  HQDes.m
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/12.
//  Copyright © 2020 tecent. All rights reserved.
//

#import "HQDes.h"


@implementation HQDes

+ (NSString*)telePhoneNumber3EDS:(NSString*)phoneNumString encryptOrDecrypt:(CCOperation)kcrypt{
    
    NSDate * date = [NSDate date];
    NSString * dateString = [self stringFromDate:date];
    NSString * khKey = [NSString stringWithFormat:@"hwd%@",dateString];
    //将key转换为C字节
    const char *test_cstr = [khKey UTF8String];
    //等等计算结果保存在result[]里, 妈蛋C#就是要24位, 你没看错....
    unsigned char result[24];
    
    //转换
    CC_MD5(test_cstr, (CC_LONG)strlen(test_cstr), result);
    //后index16-23位的值是前index0-7的值...妈蛋C#就是这样子要求我也不知道为什么...
    for (int j = 0, k = 16; j < 8; ) {
        result[k++] = result[j++];
    }
    //把数组转回来NSDATA, 因为下面转3DES接受是NSDATA
    NSData *data = [NSData dataWithBytes:result length:24];
    NSData *mydata;
    
    NSString* phoneNum3DES = @"";
    if (kcrypt == kCCEncrypt) {
        mydata = [self TripleDesEncode:[phoneNumString dataUsingEncoding:NSUTF8StringEncoding]  key:data encryptOrDecrypt:kcrypt];
        phoneNum3DES = [GTMBase64 stringByEncodingData:mydata];
    }else{
        NSData *encryptData = [GTMBase64 decodeData:[phoneNumString dataUsingEncoding:NSUTF8StringEncoding]];
        mydata = [self TripleDesEncode:encryptData  key:data encryptOrDecrypt:kcrypt];
   
        phoneNum3DES = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)mydata.bytes
                                                                         length:(NSUInteger)mydata.length] encoding:NSUTF8StringEncoding];
    
    }
    
    return phoneNum3DES;
}

+ (NSData *) TripleDesEncode:(NSData *)data key:(NSData *)key encryptOrDecrypt:(CCOperation)encryptOrDecrypt
{
    key = [key subdataWithRange:NSMakeRange(0, 24)];
    const void *vplainText = [data bytes];
    size_t plainTextBufferSize = [data length];
    vplainText = (const void *) [data bytes];
    //    NSLog(@"data:%@",data);
    //    NSLog(@"key:%@",key);
    
    //CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    // uint8_t iv[kCCBlockSize3DES];
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    // memset((void *) iv, 0x0, (size_t) sizeof(iv));
    //NSString *key = @"123456789012345678901234";
    //NSString *initVec = @"init Vec";
    const void *vkey = (const void *) [key bytes];
    //const void *vinitVec = (const void *) [initVec UTF8String];
    
    
    CCCrypt(encryptOrDecrypt,
            kCCAlgorithm3DES,
            kCCOptionECBMode | kCCOptionPKCS7Padding,
            vkey,
            kCCKeySize3DES,
            nil,
            vplainText,
            plainTextBufferSize,
            (void *)bufferPtr,
            bufferPtrSize,
            &movedBytes);
    NSData *result = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    return result;
}

+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}


@end
