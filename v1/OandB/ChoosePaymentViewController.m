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
#import "Card.h"
#import "Checkout.h"
#import "CardController.h"
#import "AccountAdapter.h"
#import "SessionController.h"
#import "NetUtils.h"

@interface ChoosePaymentViewController ()

@end

@implementation ChoosePaymentViewController

@synthesize containerCards;

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


-(void) initTable {
    if (cardTableView == nil) {
        cardTableView = [[containerCards subviews] objectAtIndex:0];
        NSLog(@"tableview %@",cardTableView);
        cardTableView.delegate = self;
        cardTableView.dataSource = self;
    }
}


-(void) refreshTable {

    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Getting cards" message:@"Please wait..." delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [alert show];
    
    [[CardController getInstance] refreshCardsForCurrentCustomerWithHandler:^(BOOL success, NSArray* cards) {
        
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
        if (success) {
            [cardTableView reloadData];
        } else {
            UIAlertView* alertError = [[UIAlertView alloc] initWithTitle:@"Uh oh" message:@"Problem getting cards" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
            [alertError show];
        }
    }];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initTable];
}

-(void) viewWillAppear:(BOOL)animated {
    [self refreshTable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

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
    static NSString *CellIdentifier = @"CardCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIColor* oldColor = cell.contentView.backgroundColor;
    UIColor* newColor;
    
    if (indexPath.row % 2 == 1) {
        newColor = [Colors getTertiaryBackgroundColor];
  
    } else {
        newColor = [Colors getSecondaryBackgroundColor];
    }
    
    cell.contentView.backgroundColor = newColor;
    /*if (oldColor != newColor) {
        [UIView animateWithDuration:0.1 animations:^{
            cell.contentView.backgroundColor = newColor;
        }];
    }*/
    
    [ViewUtil addLineBorder:cell.contentView];
    
    Card* card = [[[CardController getInstance] getCards] objectAtIndex:indexPath.row];
    
    UIImageView* cardTypeView = (UIImageView*)[cell.contentView viewWithTag:TAG_CARD_TYPE];
    [cardTypeView setImage:[ViewUtil getCardImageForCardType:[card getType]]];
     
    UILabel* last4 = (UILabel*) [cell.contentView viewWithTag:TAG_LAST_FOUR];
    [last4 setText:[NSString stringWithFormat:@"%@",[card getLastFour]]]; //could use •
    
    [ViewUtil addDisclosureIndicatorToTableCell:cell];
    
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

// The editButtonItem will invoke this method.
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    if (editing) {
        // Execute tasks for editing status
        NSLog(@"editing");
    } else {
        // Execute tasks for non-editing status.
        NSLog(@"not editing");
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        Card* card = [[[CardController getInstance] getCards] objectAtIndex:indexPath.row];
        
        // remove it locally
        [[[CardController getInstance] getCards] removeObject:card];
 
        __block BOOL didError = false;
        
        [CATransaction begin];
        [CATransaction setCompletionBlock:^{
            if (!didError) {
                [tableView reloadData];
            }
        }];
        [tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        [CATransaction commit];
        
        // remove it remotely
        [AccountAdapter deleteStripeCard:[card getStripeCardID] Session:[[SessionController getInstance] getSession] Handler:
            ^(NSURLResponse *response, NSData *data, NSError *error) {
                if ([NetUtils wasRequestSuccessful:response]) {
                    // we're happy
                } else {
                    // uh oh, add it back locally and refresh
                    didError = true;
                    [[[CardController getInstance] getCards] insertObject:card atIndex:indexPath.row];
                    [tableView reloadData];
                }
        }];
        
    }
}

@end
