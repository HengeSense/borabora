//
//  Bill.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "Bill.h"

@implementation Bill

-(id) initWithMerchantID:(int)mid Amount:(float)a {
    self = [super init];
    if (self) {
        merchantId = mid;
        amount = a;
    }
    return self;
}

-(float) getAmount { return amount; }

@end
