//
//  PaymentController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STPView.h"

@interface PaymentController : NSObject

+(NSString*) getStripeToken;
+(STPView*) getStripeView;

@end
