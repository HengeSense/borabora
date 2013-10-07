//
//  Colors.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "Colors.h"

@implementation Colors


+(UIColor*) getColorWithTranslucency:(float)a FromColor:(UIColor*)c {
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [c getRed:&red green:&green blue:&blue alpha:&alpha];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:a];
}

+(UIColor*) getPrimaryBackgroundColor {
    //return [UIColor colorWithRed:201/255.0f green:32/255.0f blue:207/255.0f alpha:1.0f];
    return [UIColor colorWithRed:132/255.0f green:47/255.0f blue:220/255.0f alpha:1.0f];
}

+(UIColor*) getSecondaryBackgroundColor {
    return [UIColor whiteColor];
}

+(UIColor*) getTertiaryBackgroundColor {
    return [UIColor colorWithWhite:0.95f alpha:1.0f];
}

+(UIColor*) getTertiaryForegroundColor {
    return [self getPrimaryBackgroundColor];
}

+(UIColor*) getPrimaryForegroundColor {
    return [UIColor whiteColor];
}

+(UIColor*) getToolbarButtonColor {
    return [self getPrimaryBackgroundColor];
}

+(UIColor*) getPrimaryButtonColor {
    return [UIColor whiteColor];
}

+(UIColor*) getSecondaryButtonColor {
    return [self getPrimaryBackgroundColor];
}

@end
