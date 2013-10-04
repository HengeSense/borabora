//
//  SessionController.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "SessionController.h"
#import "CardController.h"

@implementation SessionController

static NSString* sessionID;
static NSString* username;
static NSString* customer;

static SessionController* instance;

+(SessionController*) getInstance {
    if (instance == nil) {
        instance = [[SessionController alloc] init];
    }
    return instance;
}

-(void)setSession:(NSString*)s {
    sessionID = s;
}

-(void)setUsername:(NSString *)u {
    username = u;
}

-(void)setStripeCustomer:(NSString *)c {
    customer = c;
    [[CardController getInstance] refreshCardsForCurrentCustomer];
}

-(NSString*) getSession {
    return sessionID;
}

-(NSString*) getUsername {
    return username;
}

-(NSString*) getStripeCustomer {
    return customer;
}

@end
