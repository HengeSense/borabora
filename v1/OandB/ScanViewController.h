//
//  ScanViewController.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-22.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ScanViewController : UIViewController<ZBarReaderDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelAmount;

- (IBAction)startScanning:(id)sender;

@end
