//
//  ProcessPaymentViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"
#import "Checkout.h"

@interface ProcessPaymentViewController : SecondaryViewController {
    Checkout* checkout;
}

@property (strong, nonatomic) IBOutlet UILabel *labelComplete;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorProgress;
@property (strong, nonatomic) IBOutlet UIButton *buttonDone;
- (IBAction)doneButtonPressed:(id)sender;

-(void) completeCheckout:(Checkout*) checkout;

@end
