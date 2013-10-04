//
//  ResponseAdapter.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-02.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ResponseAdapter.h"

@implementation ResponseAdapter

-(id) initWithResponse:(NSData*)response {
    self = [super init];
    if (self) {
        // TODO: parse response code and JSON
    }
    return self;
}

-(int)getResponseCode {
    return responseCode;
}

-(bool)wasSuccessful {
    return responseCode == 200;
}

@end
