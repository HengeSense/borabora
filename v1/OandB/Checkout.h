//
//  Checkout.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bill.h"
#import "PKCard.h"

@interface Checkout : NSObject  {
    Bill* bill;
    float tipAmount;
    PKCard* card;
}

-(id) initWithBill:(Bill*)bill;
-(float) getBillAmount;
-(float) getTipAmount;
-(float) getTotalCheckoutAmount;
-(PKCard*) getCard;
-(Bill*) getBill;

-(void) setTipAmount:(float) amount;
-(void) setCard:(PKCard*) card;

+(void) startNewCheckout:(Bill*) bill;
+(Checkout*) getCurrentCheckout;

@end
