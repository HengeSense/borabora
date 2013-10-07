//
//  TabController.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InventoryItem.h"

@interface TabController : NSObject {
    NSMutableArray* tab;
}

+(TabController*) getInstance;

-(NSArray*) getTab;

-(double) getSubtotal;
-(double) getTax;
-(double) getTotal;

-(void)addToTab:(InventoryItem*)i;

-(void)removeTab:(InventoryItem*)i;

@end
