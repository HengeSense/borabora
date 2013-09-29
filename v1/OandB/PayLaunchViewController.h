//
//  PayLaunchViewController.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrimaryViewController.h"
#import "ZBarSDK.h"

@interface PayLaunchViewController : PrimaryViewController<ZBarReaderDelegate> {
    ZBarReaderViewController *codeReader;
}

-(IBAction) startScanning:(id)sender;

@end
