//
//  ResponseAdapter.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-02.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseAdapter : NSObject {
    int responseCode;
}

-(id) initWithResponse:(NSData*)response;

-(int)getResponseCode;
-(bool)wasSuccessful;


@end
