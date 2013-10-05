//
//  NetController.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-01.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "NetUtils.h"
#import "InternalCode.h"
#import "NSString+URLEncoding.h"

@implementation NetUtils

static NSString* root = @"https://healthcubed.ca/purple/u/resources/1";

+(NSString*) getPayURL {
    return [NetUtils script:@"pay.php" ];
}

+(NSString*) getAccountURL {
    return [NetUtils script:@"user.php" ];
}

+(NSString*) getSessionURL {
    return [NetUtils script:@"session.php" ];
}

+(NSString*) getCardURL {
    return [NetUtils script:@"card.php" ];
}

+(NSString*) script:(NSString*) fileName {
    return [NSString stringWithFormat:@"%@/%@",root,fileName];
}

+(NSMutableURLRequest*) getPOSTRequest:(NSString*)r FromURL:(NSString*)url {
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    request.HTTPBody   = [r dataUsingEncoding:NSUTF8StringEncoding];
    return request;
}

+(NSMutableURLRequest*) getDELETERequest:(NSString*)params FromURL:(NSString*)url {
    NSString* path = [NSString stringWithFormat:@"%@?%@",url,params];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"DELETE";
    return request;
}

+(NSMutableURLRequest*) getGETRequest:(NSString*)params FromURL:(NSString*)url {
    NSString* path = [NSString stringWithFormat:@"%@?%@",url,params];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:path]];
    request.HTTPMethod = @"GET";
    return request;
}

+(int) getResponseCodeFromResponse:(NSURLResponse*)response {
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    int responseStatusCode = [httpResponse statusCode];
    return responseStatusCode;
}

+(BOOL) wasRequestSuccessful:(NSURLResponse*)response {
    int code = [NetUtils getResponseCodeFromResponse:response];
    return code == 200; // 200 is the OK status code
}

+(int) getInternalErrorCodeFromData:(NSData*)data {
    
    NSString* value = [NetUtils getJSONValueForKey:@"internal-code" FromData:data];
    if (value) {
        return [value intValue];
    } else {
        return kUNKNOWN;
    }
}

+(id) getJSONValueForKey:(NSString*)key FromData:(NSData*)data {
    NSError *error = nil;
    id object = [NSJSONSerialization
                 JSONObjectWithData:data
                 options:0
                 error:&error];
    if([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *results = object;
        return [results objectForKey:key];
    } else {
        return nil;
    }
}

+(void) printJSONDictionaryFromData:(NSData*)data {
    NSString* newStr = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    NSLog(@"%@",newStr);
}

+(void) showErrorMessageFromCode:(int)internalCode {
    NSString* errorMessage;
    
    switch (internalCode) {
        case kBADUSERNAME:
            errorMessage = @"Invalid username";
            break;
        case kBADPASSWORD:
            errorMessage = @"Invalid password";
            break;
        case kUSEREXISTS:
            errorMessage = @"User exists";
            break;
        case kBADLOGIN:
            errorMessage = @"Invalid login";
            break;
        default:
            errorMessage = [NSString stringWithFormat:@"Unknown error: %i",internalCode];
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Oops" message:errorMessage delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
}



@end
