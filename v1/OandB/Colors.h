//
//  Colors.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Colors : NSObject

+(UIColor*) getColorWithTranslucency:(float)a FromColor:(UIColor*)c;

+(UIColor*) getPrimaryBackgroundColor;
+(UIColor*) getSecondaryBackgroundColor;
+(UIColor*) getTertiaryBackgroundColor;

+(UIColor*) getPrimaryForegroundColor;
+(UIColor*) getTertiaryForegroundColor;


+(UIColor*) getPrimaryButtonColor;
+(UIColor*) getSecondaryButtonColor;

+(UIColor*) getToolbarButtonColor;


@end
