//
//  ResponseCode.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-02.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InternalCode : NSObject

#define kBADUSERNAME 0
#define kBADPASSWORD 1
#define kUSEREXISTS 2
#define kBADLOGIN 3
#define kINVALIDSESSION 4

#define kUNKNOWN -1;

#define kKEY_SESSION @"session_id"
#define kKEY_STRIPECUSTOMER @"stripe_customer_id"

@end
