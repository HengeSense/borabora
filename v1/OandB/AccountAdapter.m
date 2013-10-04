//
//  AccountAdapter.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-02.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "AccountAdapter.h"
#import "NetUtils.h"
#import "NSString+URLEncoding.h"
#import "PKCard.h"
#import "Card.h"

@implementation AccountAdapter

+(void) createAccountWithEmail:(NSString*)email Password:(NSString*)password Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler; {
    
    NSString* body = [NSString stringWithFormat:@"email=%@&password=%@",email,password];
    
    NSMutableURLRequest* request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getAccountURL]];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(void) createSessionWithEmail:(NSString*)email Password:(NSString*)password Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    NSString* body = [NSString stringWithFormat:@"email=%@&password=%@",email,password];
    NSMutableURLRequest* request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getSessionURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(void) createCardForSession:(NSString*)session WithToken:(STPToken*)token Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    NSString* body = [NSString stringWithFormat:@"session=%@&stripeCardToken=%@",session,token.tokenId];
    NSMutableURLRequest* request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getCardURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(NSArray*) getCardsForSession:(NSString*)session {
    
    NSString* body = [NSString stringWithFormat:@"session=%@",session];
    NSMutableURLRequest* request = [NetUtils getGETRequest:body FromURL:[NetUtils getCardURL]];
    
    NSURLResponse* response;
    NSError* error;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSArray* jsonCards = [NetUtils getJSONValueForKey:@"data" FromData:data];

    NSMutableArray* cards = [[NSMutableArray alloc] init];
    
    int counter = 0;
    for (NSDictionary* dict in jsonCards) {
        NSString* lastFour = [dict objectForKey:@"last4"];
        NSString* type = [dict objectForKey:@"type"];
        Card* card = [[Card alloc] initWithLastFour:lastFour Type:type];
        [card setIndex:counter];
        [cards addObject:card];
        counter++;
    }

    return cards;
}

+(void) getUserForSession:(NSString*)session Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    NSString* params = [NSString stringWithFormat:@"session=%@",[session urlEncodeUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest* request = [NetUtils getGETRequest:params FromURL:[NetUtils getAccountURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

@end
