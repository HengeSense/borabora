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

-(void)setToken:(NSString*)t { token = t; }
-(void)setIndex:(int)i { index = i; }

-(NSString*)getType { return type; }
-(NSString*)getLastFour { return lastFour; }
-(int)getIndex { return index; }
-(STPToken*)getToken { return token; }

@end
