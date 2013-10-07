//
//  ScanViewController.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *viewCodeContainer;
@property (strong, nonatomic) IBOutlet UILabel *labelAmount;
- (IBAction)closeButtonPressed:(id)sender;

@end
