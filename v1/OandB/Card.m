//
//  Card.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "Card.h"

@implementation Card

-(id)initWithLastFour:(NSString*)l Type:(NSString*)t {
    self = [super init];
    if (self) {
        lastFour = l;
        type = t;
    }
    return self;
}

-(void) setPKCard:(PKCard*)p {
    pkcard = p;
}
-(void)setStripeCardID:(NSString *)c { stripeCardID = c; }

-(NSString*)getType { return type; }
-(NSString*)getLastFour { return lastFour; }
-(NSString*)getStripeCardID { return stripeCardID; }
-(PKCard*)getPKCard { return pkcard; }

@end
