//
//  Card.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STPToken.h"

@interface Card : NSObject {
    int index;
    NSString* lastFour;
    NSString* type;
    STPToken* token;
}

-(id)initWithLastFour:(NSString*)lastFour Type:(NSString*)type;

-(void)setToken:(STPToken*)t;
-(void)setIndex:(int)i;

-(NSString*)getType;
-(NSString*)getLastFour;
-(int)getIndex;
-(STPToken*)getToken;

@end
