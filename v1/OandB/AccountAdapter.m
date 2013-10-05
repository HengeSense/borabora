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

+(void) createPaymentWithToken:(NSString*)token Amount:(double)amount Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {

    NSString *body = [NSString stringWithFormat:@"stripeToken=%@&amount=%.02f", token,amount];
    NSMutableURLRequest* request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getPayURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(void) createPaymentWithStripeCard:(NSString*)stripeCardID  Session:(NSString*)session Amount:(double)amount Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    NSString *body = [NSString stringWithFormat:@"stripeCardID=%@&session=%@&amount=%.02f", stripeCardID,session,amount];
    NSMutableURLRequest* request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getPayURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(void) getCardsForSession:(NSString*)session
                   Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    NSString* body = [NSString stringWithFormat:@"session=%@",session];
    NSMutableURLRequest* request = [NetUtils getGETRequest:body FromURL:[NetUtils getCardURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

+(NSMutableArray*) parseCardsFromData:(NSData*)data {
    
    NSArray* jsonCards = [NetUtils getJSONValueForKey:@"data" FromData:data];
    
    NSMutableArray* cards = [[NSMutableArray alloc] init];
    
    [NetUtils printJSONDictionaryFromData:data];
    
    int counter = 0;
    for (NSDictionary* dict in jsonCards) {
        NSString* lastFour = [dict objectForKey:@"last4"];
        NSString* type = [dict objectForKey:@"type"];
        NSString* stripeID = [dict objectForKey:@"id"];
        Card* card = [[Card alloc] initWithLastFour:lastFour Type:type];
        [card setStripeCardID:stripeID];
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

+(void) deleteStripeCard:(NSString*)card Session:(NSString*)session Handler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    
    NSString* body = [NSString stringWithFormat:@"session=%@&stripeCardID=%@",session,card];
    NSMutableURLRequest* request = [NetUtils getDELETERequest:body FromURL:[NetUtils getCardURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:handler];
}

@end
