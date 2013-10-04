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

@synthesize buttonAddCard,viewCreditCardContainer;

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

static STPToken* lastValidToken;

- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{

    // Toggle navigation, for example
    [buttonAddCard setEnabled:valid];

    if (valid) {
        [view createToken:^(STPToken *token, NSError *error) {
            if (error) {
                // Handle error
                lastValidToken = nil;
            } else {
                // Send off token to your server
                lastValidToken = token;
            }
        }];
    } else {
        lastValidToken = nil;
    }
}

-(void) addCardByToken:(STPToken*) token {
    [AccountAdapter createCardForSession:[[SessionController getInstance] getSession] WithToken:token Handler:^(NSURLResponse *response, NSData *data, NSError *error) {
        // session successful
        if ([NetUtils wasRequestSuccessful:response]) {
            [NetUtils printJSONDictionaryFromData:data];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSLog(@"Error");
        }
    }];
}

- (IBAction)addButtonPressed:(id)sender {
    if (lastValidToken != nil) {
        [self addCardByToken:lastValidToken];
    }
}

@end
