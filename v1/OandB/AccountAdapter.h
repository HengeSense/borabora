//
//  AccountAdapter.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-02.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseAdapter.h"
#import "STPToken.h"

@interface AccountAdapter : NSObject

// Async calls
+(void) createAccountWithEmail:(NSString*)email Password:(NSString*)password Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;

+(void) createSessionWithEmail:(NSString*)email Password:(NSString*)password Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;

+(void) createCardForSession:(NSString*)session WithToken:(STPToken*)token Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;

+(void) getUserForSession:(NSString*)session Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler;

// Sync calls
+(NSArray*) getCardsForSession:(NSString*)session;

@end
