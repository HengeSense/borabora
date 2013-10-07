//
//  InventoryItem.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "InventoryItem.h"

@implementation InventoryItem

-(id) initWithName:(NSString*)n Description:(NSString*)d Image:(UIImage*)i Amount:(double)a {
    self = [super init];
    if (self) {
        name = n;
        description = d;
        image = i;
        amount = a;
    }
    return self;
}

-(NSString*)getName { return name; }
-(NSString*)getDescription { return  description; }
-(UIImage*)getImage { return image; }
-(double)getAmount { return amount; }

@end
