//
//  NetController.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-01.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetUtils : NSObject

+(NSString*) getPayURL;
+(NSString*) getAccountURL;
+(NSString*) getSessionURL;
+(NSString*) getCardURL;
+(NSMutableURLRequest*) getPOSTRequest:(NSString*)r FromURL:(NSString*)url;
+(NSMutableURLRequest*) getDELETERequest:(NSString*)r FromURL:(NSString*)url;
+(NSMutableURLRequest*) getGETRequest:(NSString*)r FromURL:(NSString*)url;
+(int) getResponseCodeFromResponse:(NSURLResponse*)response;
+(BOOL) wasRequestSuccessful:(NSURLResponse*)response;
+(int) getInternalErrorCodeFromData:(NSData*)data;
+(id) getJSONValueForKey:(NSString*)key FromData:(NSData*)data;
+(void) printJSONDictionaryFromData:(NSData*)data;
+(void) showErrorMessageFromCode:(int)code;


@end

