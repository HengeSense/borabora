//
//  CryptoUtils.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "CryptoUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation CryptoUtils

+ (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}

@end
