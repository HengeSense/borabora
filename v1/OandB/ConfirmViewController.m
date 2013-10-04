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
#import "ProcessPaymentViewController.h"

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
    
    UIImage* cardImage = [ViewUtil getCardImageForCardType:[[checkout getCard] getType]];
    [imageViewCard setImage:cardImage];
    
    [labelLastFour setText:[[checkout getCard] getLastFour]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)confirmButtonPressed:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProcessPaymentViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ProcessPaymentViewController"];
    [self.navigationController pushViewController:vc animated:YES];

    [vc completeCheckout:[Checkout getCurrentCheckout]];
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
