//
//  TabController.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "TabController.h"

@implementation TabController

static TabController* instance;

+(TabController*) getInstance {
    if (instance == nil) {
        instance = [[TabController alloc] init];
    }
    return instance;
}

-(id) init {
    self = [super init];
    if (self) {
        tab = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray*) getTab {
    return tab;
}

-(void)addToTab:(InventoryItem*)i {
    [tab addObject:i];
    [self notifyObservers];
}

-(void)removeTab:(InventoryItem*)i {
    [tab removeObject:i];
    [self notifyObservers];
}

-(void) notifyObservers {
    NSLog(@"Notifying observers");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tabChanged" object:self];
}

-(double) getSubtotal {
    double subtotal = 0.0;
    for (InventoryItem* i in tab) {
        subtotal += [i getAmount];
    }
    return subtotal;
}

-(double) getTax {
    return [self getSubtotal]*0.13;
}

-(double) getTotal {
    return [self getSubtotal]*1.13;
}


@end
