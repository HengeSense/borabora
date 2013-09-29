//
//  CardViewController.h
//  OandB
//
//  Created by Marc Fiume on 2013-09-22.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STPView.h"

@interface CardViewController : UIViewController<STPViewDelegate>

@property STPView* stripeView;
@property (strong, nonatomic) IBOutlet UIButton *payButton;
- (IBAction)payButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewCreditCardContainer;

@end
