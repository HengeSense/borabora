//
//  CardViewController.m
//  OandB
//
//  Created by Marc Fiume on 2013-09-22.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "CardViewController.h"
#import "PaymentController.h"
#import "NetUtils.h"

@interface CardViewController ()

@end

@implementation CardViewController

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
	// Do any additional setup after loading the view, typically from a nib.
    
    self.stripeView = [PaymentController getStripeView];
    self.stripeView.delegate = self;
    [self.viewCreditCardContainer addSubview:self.stripeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
    self.payButton.enabled = valid;
}

- (IBAction)payButtonPressed:(id)sender {
    [self.stripeView createToken:^(STPToken *token, NSError *error) {
        if (error) {
            // Handle error
            [self handleError:error];
        } else {
            // Send off token to your server
            [self handleToken:token];
        }
    }];
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

- (void)handleToken:(STPToken *)token
{
    NSLog(@"Received token %@", token.tokenId);
    
    NSString *body     = [NSString stringWithFormat:@"stripeToken=%@", token.tokenId];
    NSMutableURLRequest *request = [NetUtils getPOSTRequest:body FromURL:[NetUtils getPayURL]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (error) {
                                   // Handle error
                                   NSLog(@"Payment failed!");
                               } else {
                                   NSLog(@"Payment succeeded!");
                                   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                   UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ReceiptView"];
                                   [self.navigationController pushViewController:vc animated:YES];
                               }
                           }];
}

@end
