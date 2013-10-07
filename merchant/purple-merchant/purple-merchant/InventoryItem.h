//
//  InventoryItem.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InventoryItem : NSObject {
    NSString* name;
    NSString* description;
    UIImage* image;
    double amount;
}

-(id) initWithName:(NSString*)n Description:(NSString*)s Image:(UIImage*)i Amount:(double)a;
-(NSString*)getName;
-(NSString*)getDescription;
-(UIImage*)getImage;
-(double)getAmount;

@end
