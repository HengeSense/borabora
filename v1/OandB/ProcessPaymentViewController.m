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
#import "NetUtils.h"
#import "AccountAdapter.h"
#import "SessionController.h"

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

-(void) checkoutFailed {
    [indicatorProgress setHidden:YES];
    [labelComplete setHidden:NO];
    [labelComplete setText:@"checkout failed"];
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
    if ([card getPKCard] != nil) {
        
        PKCard* pkCard = [card getPKCard];
        STPCard* scard = [[STPCard alloc] init];
        
        scard.number = pkCard.number;
        scard.expMonth = pkCard.expMonth;
        scard.expYear = pkCard.expYear;
        scard.cvc = pkCard.cvc;
        
        [Stripe createTokenWithCard:scard
                     publishableKey:[PaymentController getStripeToken]
                         completion:^(STPToken *token, NSError *error) {
                             [self payWithCardToken:token.tokenId];
                         }];
    } else {
        [self payWithStripeCardID:[card getStripeCardID]];
    }
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

- (void)payWithStripeCardID:(NSString*)cardID
{
    NSLog(@"Checking out with index %@ and session %@",cardID,[[SessionController getInstance] getSession]);
    
    [AccountAdapter createPaymentWithStripeCard:cardID Session:[[SessionController getInstance] getSession] Amount:[checkout getTotalCheckoutAmount] Handler:^(NSURLResponse *response, NSData *data, NSError *error) {
        // session successful
        if ([NetUtils wasRequestSuccessful:response]) {
            [self checkoutSuccessful];
            [NetUtils printJSONDictionaryFromData:data];
        } else {
            [self checkoutFailed];
            NSLog(@"Error");
        }
    }];
}

- (void)payWithCardToken:(NSString *)token
{
    NSLog(@"Paying with token %@", token);
    
    [AccountAdapter createPaymentWithToken:token Amount:[checkout getTotalCheckoutAmount] Handler:^(NSURLResponse *response, NSData *data, NSError *error) {
        // session successful
        if ([NetUtils wasRequestSuccessful:response]) {
            [self checkoutSuccessful];
        } else {
            [self checkoutFailed];
            NSLog(@"Error");
        }
    }];
}


@end
