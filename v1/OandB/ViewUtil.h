//
//  ViewUtil.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKCard.h"

@interface ViewUtil : NSObject

+(void) roundView:(UIView*)view;
+(void) addLineBorder:(UIView*)view;
+(NSString*) convertFloatToMoneyString:(float)amount;
+(UIImage*) getCardImageForCard:(PKCard*)card;

@end
