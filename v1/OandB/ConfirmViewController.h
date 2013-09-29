//
//  ConfirmViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"
#import "RoundedTextView.h"

@interface ConfirmViewController : SecondaryViewController
@property (strong, nonatomic) IBOutlet UILabel *labelTotalAmount;
@property (strong, nonatomic) IBOutlet UILabel *labelLastFour;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewCard;
- (IBAction)confirmButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;


@end
