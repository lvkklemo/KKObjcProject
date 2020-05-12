//
//  HQDes.h
//  KKObjcProject
//
//  Created by 宇航 on 2020/5/12.
//  Copyright © 2020 tecent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTMBase64.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface HQDes : NSObject
+ (NSString*)telePhoneNumber3EDS:(NSString*)phoneNumString encryptOrDecrypt:(CCOperation)kcrypt;
@end

