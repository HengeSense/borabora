//
//  CardController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "CardController.h"
#import "SessionController.h"
#import "AccountAdapter.h"
#import "NetUtils.h"
#import "AccountAdapter.h"

@implementation CardController

static CardController* instance;

+(CardController*) getInstance {
    if (instance == nil) {
        instance = [[CardController alloc] init];
    }
    return instance;
}

-(id) init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(NSArray*) getCards {
    return cards;
}

-(int) getNumCards {
    return [cards count];
}

-(void) refreshCardsForCurrentCustomer {
    
    NSLog(@"a");
    NSString* session = [[SessionController getInstance] getSession];
    if (session == nil) { return; }
    
    NSLog(@"b");
    cards = [AccountAdapter getCardsForSession:session];
    
    NSLog(@"c");
    [AccountAdapter getUserForSession:session Handler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
         
         // successful
         if ([NetUtils wasRequestSuccessful:response]) {
             
             NSLog(@"f");
             [NetUtils printJSONDictionaryFromData:data];
             
             // failed
         } else {
             NSLog(@"e");
             int internalCode = [NetUtils getInternalErrorCodeFromData:data];
             [NetUtils showErrorMessageFromCode:internalCode];
         }
         
     }];
}

@end
