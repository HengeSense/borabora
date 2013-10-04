//
//  OneTimeAddCardViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"
#import "STPView.h"

@interface OneTimeAddCardViewController : SecondaryViewController<STPViewDelegate>

@property STPView* stripeView;
@property (strong, nonatomic) IBOutlet UIView *viewCardContainer;
@property (strong, nonatomic) IBOutlet UIButton *buttonReview;
- (IBAction)reviewButtonPressed:(id)sender;

@end
