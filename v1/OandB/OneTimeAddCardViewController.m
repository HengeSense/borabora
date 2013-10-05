//
//  OneTimeAddCardViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "OneTimeAddCardViewController.h"
#import "PaymentController.h"
#import "Checkout.h"
#import "Card.h"
#import "PKCard.h"
#import "ViewUtil.h"

@interface OneTimeAddCardViewController ()

@end

@implementation OneTimeAddCardViewController

@synthesize stripeView,viewCardContainer,buttonReview;

static PKCard* lastValidCard;

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
    [self.viewCardContainer addSubview:self.stripeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
    [buttonReview setEnabled:valid];
    
    if (valid) {
        lastValidCard = card;
    } else {
        lastValidCard = nil;
    }
}

- (IBAction)reviewButtonPressed:(id)sender {

    Card* c = [[Card alloc] initWithLastFour:lastValidCard.last4 Type:[ViewUtil cardNumberToType:lastValidCard.number]];
    [c setPKCard:lastValidCard];
    
    [[Checkout getCurrentCheckout] setCard:c];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ConfirmViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
