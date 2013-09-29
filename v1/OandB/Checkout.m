//
//  Checkout.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "Checkout.h"
#import "Bill.h"
#import "PKCard.h"

@implementation Checkout


-(id) initWithBill:(Bill*)b {
    self = [super init];
    if (self) {
        bill = b;
    }
    return self;
}

-(float) getBillAmount { return [bill getAmount]; }
-(float) getTipAmount { return tipAmount; }
-(float) getTotalCheckoutAmount { return tipAmount+[self getBillAmount]; }
-(PKCard*) getCard { return card; }
-(Bill*) getBill { return bill; }

-(void) setTipAmount:(float) amount { tipAmount = amount; }
-(void) setCard:(PKCard*) c { card = c; }

static Checkout* currentCheckout;

+(void) startNewCheckout:(Bill*) bill {
    currentCheckout = [[Checkout alloc] initWithBill:bill];
}

+(Checkout*) getCurrentCheckout {
    return currentCheckout;
}

@end
