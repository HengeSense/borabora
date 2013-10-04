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
#import "Colors.h"

@implementation ViewUtil

+(void) roundView:(UIView*)view {
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}

+(void) addLineBorder:(UIView *)view {
    view.layer.borderWidth = 1;
    view.layer.borderColor = [[UIColor colorWithWhite:0.95f alpha:1.0f] CGColor];
}

+(NSString*) convertFloatToMoneyString:(float)amount {
    return [NSString stringWithFormat:@"$%.02f",amount];
}

+(UIImage*) getCardImageForCard:(PKCard*)card {
    return [UIImage imageNamed:[self cardNumberToType:card.number]];
}

+(UIImage*) getCardImageForCardType:(NSString*)type {
    return [UIImage imageNamed:[type lowercaseString]];
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

+(NSString*) getDefaultFontFamily {
    return @"HelveticaNeue-Light";
}

+(void)addDisclosureIndicatorToTableCell:(UITableViewCell*) cell {
    
    CGRect container = cell.contentView.frame;
    
    int width = 10;
    UILabel* indicator = [[UILabel alloc] initWithFrame:CGRectMake(container.size.width-20-width, 0, width, container.size.height)];
    
    [indicator setText:@"›"];
    [indicator setFont:[UIFont fontWithName:[self getDefaultFontFamily] size:30]];
    [indicator setTextColor:[Colors getSecondaryButtonColor]];
    [cell.contentView addSubview:indicator];
}

+(NSString*) getMembershipName {
    return @"Purple ID";
}

@end
