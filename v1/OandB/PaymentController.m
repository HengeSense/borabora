//
//  PaymentController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "PaymentController.h"

@implementation PaymentController

+(NSString*) getStripeToken {
    return @"pk_test_sTO7YONO6FZ0ZnrW4SlcXh0S";
}

+(STPView*) getStripeView {
    return [[STPView alloc] initWithFrame:CGRectMake(15,0,290,55)
                                   andKey:[PaymentController getStripeToken]];
}

@end
