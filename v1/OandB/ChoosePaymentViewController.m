//
//  PaymentViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ChoosePaymentViewController.h"
#import "Colors.h"
#import "ViewUtil.h"
#import "CardController.h"
#import "PKCardNumber.h"
#import "Checkout.h"
#import "CardController.h"

@interface ChoosePaymentViewController ()

@end

@implementation ChoosePaymentViewController

@synthesize containerCards,buttonAddCard;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void) viewDidAppear:(BOOL)animated {
    [self initTable];
}

-(void) initTable {
    
    cardTableView = [[containerCards subviews] objectAtIndex:0];
    NSLog(@"tableview %@",cardTableView);
    cardTableView.delegate = self;
    cardTableView.dataSource = self;
    [self refreshTable];
}

-(void) refreshTable {
    [cardTableView reloadData];
    CGRect frame = containerCards.frame;
    float newHeight = 44*[[CardController getInstance] getNumCards];
    NSLog(@"Setting new height to be %f for %@",newHeight,containerCards);
    
    [containerCards setHidden:NO];
    [containerCards setFrame:CGRectMake(frame.origin.x, frame.origin.y, cardTableView.frame.size.width, newHeight)];
    [containerCards setNeedsDisplay];
    
    
    CGRect buttonFrame = buttonAddCard.frame;
    [buttonAddCard setFrame:CGRectMake(buttonFrame.origin.x, containerCards.frame.origin.y+newHeight+10, buttonFrame.size.width, buttonFrame.size.height)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [ViewUtil roundView:containerCards];
    [ViewUtil addLineBorder:containerCards];

    [containerCards setHidden:YES];
    [containerCards setTranslatesAutoresizingMaskIntoConstraints:YES];
    [buttonAddCard setTranslatesAutoresizingMaskIntoConstraints:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"Getting sections");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[CardController getInstance] getNumCards];
}

static int TAG_CARD_TYPE = 1;
static int TAG_LAST_FOUR = 2;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Getting cell");
    
    static NSString *CellIdentifier = @"CardCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 1) {
        [cell.contentView setBackgroundColor:[Colors getTertiaryBackgroundColor]];
    }
    
    PKCard* card = [[[CardController getInstance] getCards] objectAtIndex:indexPath.row];
    
    UIImageView* cardTypeView = (UIImageView*)[cell.contentView viewWithTag:TAG_CARD_TYPE];
    [cardTypeView setImage:[ViewUtil getCardImageForCard:card]];
    
    UILabel* last4 = (UILabel*) [cell.contentView viewWithTag:TAG_LAST_FOUR];
    [last4 setText:[NSString stringWithFormat:@"%@",card.last4]]; //could use •
    
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"Selected card");
    
    PKCard* card = [[[CardController getInstance] getCards] objectAtIndex:indexPath.row];
    [[Checkout getCurrentCheckout] setCard:card];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ConfirmViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
