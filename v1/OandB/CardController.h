//
//  CardController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKCard.h"

@interface CardController : NSObject {
    NSMutableArray* cards;
}

+(CardController*) getInstance;

-(NSArray*) getCards;
-(int) getNumCards;
-(void) addCard:(PKCard*) card;

@end
