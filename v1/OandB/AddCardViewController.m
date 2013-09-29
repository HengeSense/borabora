//
//  AddCardViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-29.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "AddCardViewController.h"
#import "CardController.h"

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
    
    self.stripeView = [[STPView alloc] initWithFrame:CGRectMake(15,0,290,55)
                                              andKey:@"pk_test_sTO7YONO6FZ0ZnrW4SlcXh0S"];
    self.stripeView.delegate = self;
    [self.viewCreditCardContainer addSubview:self.stripeView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

static PKCard* lastValidCard;

- (void)stripeView:(STPView *)view withCard:(PKCard *)card isValid:(BOOL)valid
{
    // Toggle navigation, for example
    [buttonAddCard setEnabled:valid];
    
    if (valid) {
        lastValidCard = card;
    } else {
        lastValidCard = nil;
    }
}

- (IBAction)addButtonPressed:(id)sender {
    if (lastValidCard != nil) {
        [[CardController getInstance] addCard:lastValidCard];
        [self.navigationController popViewControllerAnimated:YES];
    }

}

@end
