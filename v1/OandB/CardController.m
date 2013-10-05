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

-(NSMutableArray*) getCards {
    return cards;
}

-(int) getNumCards {
    return [cards count];
}

-(void) refreshCardsForCurrentCustomerWithHandler:(void (^)(BOOL success, NSArray* cards))handler{
    
    NSString* session = [[SessionController getInstance] getSession];
    if (session == nil) { return; }
    
    [AccountAdapter getCardsForSession:session Handler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        BOOL success = false;
        // session successful
        if ([NetUtils wasRequestSuccessful:response]) {
            cards = [AccountAdapter parseCardsFromData:data];
            success = true;
        } else {
            NSLog(@"Error");
        }
        
        handler(success,cards);
    }];

}

@end
