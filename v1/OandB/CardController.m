//
//  CardController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "CardController.h"

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
        cards = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray*) getCards {
    return cards;
}

-(int) getNumCards {
    return [cards count];
}

-(void) addCard:(PKCard*) card {
    [cards addObject:card];
}

@end
