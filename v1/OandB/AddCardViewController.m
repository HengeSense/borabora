//
//  AddCardViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "AddCardViewController.h"
#import "CardController.h"
#import "PaymentController.h"
#import "AccountAdapter.h"
#import "NetUtils.h"
#import "SessionController.h"

@interface AddCardViewController ()

@end

@implementation AddCardViewController

@synthesize buttonAddCard,viewCreditCardContainer,indicatorGetToken;

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
    
    self.stripeView = [PaymentController getStripeView];
    self.stripeView.delegate = self;
    [self.viewCreditCardContainer addSubview:self.stripeView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
    [buttonAddCard setEnabled:valid];
}

- (IBAction)addButtonPressed:(id)sender {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Adding card" message:@"Please wait..." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    
    [self.stripeView createToken:^(STPToken *token, NSError *error) {
        [indicatorGetToken setHidden:YES];
        
        UIAlertView* alertError = [[UIAlertView alloc] initWithTitle:@"Uh ok" message:@"Problem adding card" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        
        if (error) {
            [alert dismissWithClickedButtonIndex:0 animated:YES];
            [alertError show];
        } else {
            [AccountAdapter createCardForSession:[[SessionController getInstance] getSession] WithToken:token Handler:^(NSURLResponse *response, NSData *data, NSError *error) {
                // session successful
                if ([NetUtils wasRequestSuccessful:response]) {
                    [alert dismissWithClickedButtonIndex:0 animated:YES];
                    [self dismissViewControllerAnimated:YES completion:nil];
                } else {
                    [alertError show];
                }
            }];
        }
    }];
}

@end
