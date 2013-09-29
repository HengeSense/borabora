//
//  AddCardViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"
#import "STPView.h"

@interface AddCardViewController : SecondaryViewController<STPViewDelegate>

@property STPView* stripeView;
@property (strong, nonatomic) IBOutlet UIButton *buttonAddCard;

- (IBAction)addButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *viewCreditCardContainer;


@end
