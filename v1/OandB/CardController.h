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
    NSArray* cards;
}

+(CardController*) getInstance;

-(NSArray*) getCards;
-(int) getNumCards;

-(void) refreshCardsForCurrentCustomer;

@end
