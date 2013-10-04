//
//  SessionController.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-03.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionController : NSObject

+(SessionController*) getInstance;
-(void)setSession:(NSString*)session;
-(void)setUsername:(NSString*)username;
-(void)setStripeCustomer:(NSString*)customer;

-(NSString*) getSession;
-(NSString*) getUsername;
-(NSString*) getStripeCustomer;

@end
