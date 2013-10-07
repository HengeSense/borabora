//
//  InventoryController.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "InventoryController.h"
#import "InventoryItem.h"

@implementation InventoryController

static InventoryController* instance;

+(InventoryController*) getInstance {
    if (instance == nil) {
        instance = [[InventoryController alloc] init];
    }
    return instance;
}

static UIImage* image;

-(id) init {
    self = [super init];
    if (self) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.mcdonalds.com/content/dam/McDonalds/item/mcdonalds-Big-Mac.png"]]];
        inventory = [[NSMutableArray alloc] init];
        for (int i = 0; i < 30; i++) {
            [inventory addObject:[[InventoryItem alloc] initWithName:@"Big Mac" Description:@"Really?" Image:image Amount:3.57]];
        }
    }
    return self;
}

-(NSArray*)getInventory {
    return inventory;
}


@end
