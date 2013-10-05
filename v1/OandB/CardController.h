//
//  CardController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STPToken.h"

@interface CardController : NSObject {
    NSMutableArray* cards;
}

+(CardController*) getInstance;

-(NSMutableArray*) getCards;
-(int) getNumCards;

-(void) refreshCardsForCurrentCustomerWithHandler:(void (^)(BOOL success, NSArray* cards))handler;

@end
