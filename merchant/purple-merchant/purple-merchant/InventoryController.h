//
//  InventoryController.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InventoryItem.h"

@interface InventoryController : NSObject {
    NSMutableArray* inventory;
}

+(InventoryController*) getInstance;

-(NSArray*)getInventory;


@end
