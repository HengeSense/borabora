//
//  ConfirmViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ConfirmViewController.h"
#import "ViewUtil.h"
#import "Checkout.h"

@implementation ConfirmViewController

@synthesize labelLastFour, labelTotalAmount, imageViewCard;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    Checkout* checkout = [Checkout getCurrentCheckout];
    [labelTotalAmount setText:[ViewUtil convertFloatToMoneyString:[checkout getTotalCheckoutAmount]]];
    
    UIImage* cardImage = [ViewUtil getCardImageForCard:[checkout getCard]];
    [imageViewCard setImage:cardImage];
    
    [labelLastFour setText:[checkout getCard].last4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)confirmButtonPressed:(id)sender {
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
