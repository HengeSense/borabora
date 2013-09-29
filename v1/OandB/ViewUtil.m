//
//  ViewUtil.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ViewUtil.h"
#import <QuartzCore/QuartzCore.h>
#import "PKCardNumber.h"

@implementation ViewUtil

+(void) roundView:(UIView*)view {
    view.layer.borderColor = [[UIColor colorWithWhite:0.95f alpha:1.0f] CGColor];
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}

+(void) addLineBorder:(UIView *)view {
    view.layer.borderWidth = 1;
}

+(NSString*) convertFloatToMoneyString:(float)amount {
    return [NSString stringWithFormat:@"$%.02f",amount];
}

+(UIImage*) getCardImageForCard:(PKCard*)card {
    return [UIImage imageNamed:[self cardNumberToType:card.number]];
}

+(NSString*) cardNumberToType:(NSString*) number {
    
    PKCardNumber *cardNumber = [PKCardNumber cardNumberWithString:number];
    PKCardType cardType      = [cardNumber cardType];
    
    NSString* cardTypeName   = @"placeholder";
    
    switch (cardType) {
        case PKCardTypeAmex:
            cardTypeName = @"amex";
            break;
        case PKCardTypeDinersClub:
            cardTypeName = @"diners";
            break;
        case PKCardTypeDiscover:
            cardTypeName = @"discover";
            break;
        case PKCardTypeJCB:
            cardTypeName = @"jcb";
            break;
        case PKCardTypeMasterCard:
            cardTypeName = @"mastercard";
            break;
        case PKCardTypeVisa:
            cardTypeName = @"visa";
            break;
        default:
            break;
    }
    
    return cardTypeName;
}

@end
