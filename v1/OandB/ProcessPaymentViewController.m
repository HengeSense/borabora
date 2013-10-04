//
//  ProcessPaymentViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ProcessPaymentViewController.h"
#import "STPView.h"
#import "Stripe.h"
#import "PaymentController.h"

@interface ProcessPaymentViewController ()

@end

@implementation ProcessPaymentViewController

@synthesize indicatorProgress,labelComplete,buttonDone;

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
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) checkoutSuccessful {
    [indicatorProgress setHidden:YES];
    [labelComplete setHidden:NO];
    [buttonDone setEnabled:YES];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) completeCheckout:(Checkout*) c {
    NSLog(@"Checking out!");
    
    checkout = c;
    
    Card* card = [c getCard];
    
    [Stripe setDefaultPublishableKey:[PaymentController getStripeToken]];
    if ([card getToken] != nil) {
        [self payWithCardToken:[card getToken]];
    } else {
        [self payWithCardIndex:[card getIndex]];
    }
}

-(STPCard*) STPCardFromPKCard:(PKCard*)card {
    STPCard* scard = [[STPCard alloc] init];
    
    scard.number = card.number;
    scard.expMonth = card.expMonth;
    scard.expYear = card.expYear;
    scard.cvc = card.cvc;
    
    return scard;
}

- (void)handleError:(NSError *)error
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"Error")
                                                      message:[error localizedDescription]
                                                     delegate:nil
                                            cancelButtonTitle:NSLocalizedString(@"OK", @"OK")
                                            otherButtonTitles:nil];
    [message show];
}

- (void)payWithCardIndex:(int)index
{
    NSLog(@"TODO");
    // TODO
}

- (void)payWithCardToken:(STPToken *)token
{
    NSLog(@"Received token %@", token.tokenId);
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://healthcubed.ca/borabora/u/pay.php"]];
    request.HTTPMethod = @"POST";
    NSString *body     = [NSString stringWithFormat:@"stripeToken=%@&amount=%.02f", token.tokenId,[checkout getTotalCheckoutAmount]];
    request.HTTPBody   = [body dataUsingEncoding:NSUTF8StringEncoding];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (error) {
                                   // Handle error
                                   NSLog(@"Payment failed!");
                               } else {
                                   [self checkoutSuccessful];
                               }
                           }];
}


@end
