//
//  Qy3DES.h
//  GameLive
//
//  Created by qingyun on 12/26/13.
//  Copyright (c) 2013 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>


@interface Qy3DES : NSObject

//3DES加密
+ (NSString *) encrypt3DesStr:(NSString *) str withKey:(NSString *)key;

//3DES解密 
+ (NSString *) decrypt3DesStr:(NSString	*) str withKey:(NSString *)key;

//3DES解密-------把服务器反回的json格式解成可读的格式
+(NSDictionary*)decrypt3DesJson:(NSString*)str withKey:(NSString*)key;
@end
