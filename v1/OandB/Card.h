//
//  Card.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKCard.h"

@interface Card : NSObject {
    //int index;
    NSString* stripeCardID;
    NSString* lastFour;
    NSString* type;
    PKCard* pkcard;
}

-(id)initWithLastFour:(NSString*)lastFour Type:(NSString*)type;

-(void)setPKCard:(PKCard*)p;
//-(void)setIndex:(int)i;
-(void)setStripeCardID:(NSString*)c;

-(NSString*)getType;
-(NSString*)getLastFour;
//-(int)getIndex;
-(PKCard*)getPKCard;
-(NSString*)getStripeCardID;

@end
