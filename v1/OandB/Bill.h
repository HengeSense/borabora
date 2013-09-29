//
//  Bill.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bill : NSObject {
    int merchantId;
    float amount;
}

-(id) initWithMerchantID:(int)merchantId Amount:(float)amount;

-(float) getAmount;


@end
