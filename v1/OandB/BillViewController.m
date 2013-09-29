//
//  BillViewController.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "BillViewController.h"
#import "Colors.h"
#import "Bill.h"
#import "ViewUtil.h"
#import "Checkout.h"

@interface BillViewController ()

@end

@implementation BillViewController

@synthesize buttonAddTip,buttonPayNow, containerAmounts, viewLogo;

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

    
    [ViewUtil addLineBorder:containerAmounts];
    [ViewUtil roundView:containerAmounts];
    [ViewUtil roundView:viewLogo];
}

-(void) viewDidAppear:(BOOL)animated {
    UITableView* amountsTable = (UITableView*) [containerAmounts.subviews objectAtIndex:0];
    labelBillOriginalAmount = [self getLabelFromTable:amountsTable Row:0];
    labelTipAmount = [self getLabelFromTable:amountsTable Row:1];
    labelBillGrandTotalAmount = [self getLabelFromTable:amountsTable Row:2];
    
    [self refreshForCurrentBill];
}

-(UILabel*) getLabelFromTable:(UITableView*) table Row:(int)row {

    //NSLog(@"Getting label for %i from %@",row,table);
    NSIndexPath* path = [NSIndexPath indexPathForRow:row inSection:0];
    UIView* cellView = [table cellForRowAtIndexPath:path];
    UIView* scrollView = [[cellView subviews] objectAtIndex:0]; // scrollview is 0th child of cell
    UIView* cellContentView = [[scrollView subviews] objectAtIndex:0]; // content view is 0th child of scrollView
    UILabel* label =  [[cellContentView subviews] objectAtIndex:1];
    return label;
    
}

-(void) printSubviews:(UIView*) v {
    NSLog(@"Subviews of %@",[v class]);
    for (UIView* s in [v subviews]) {
        NSLog(@"\t%@",[s class]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(id)sender {
    NSLog(@"Cancelling payment workflow");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addTipButtonPressed:(id)sender {
    /*
    int pickerHeight = 200;
    UIPickerView* picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-pickerHeight+20, 320, pickerHeight)];
    [picker setBackgroundColor:[Colors getSecondaryBackgroundColor]];
    picker.delegate = self;
    [self.view addSubview:picker];
    */
    
    
    [self createActionSheet];
    [actionSheet showInView:self.view];
    [actionSheet setBounds:CGRectMake(0,0,320,464)];
    
    
    NSLog(@"Showing actionsheet");
    //[actionSheet showInView:self.view];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0 || component == 1) {
        return 10;
    } else {
        return 2;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0 || component == 1) {
        if (component == 0 && row == 0) { return @""; }
        return [NSString stringWithFormat:@"%i",row];
    } else {
        if (row == 0) {
            return @"%";
        } else {
            return @"$";
        }
    }
}




- (void)createActionSheet {
    if (actionSheet == nil) {
        // setup actionsheet to contain the UIPicker
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Add Tip"
                                                  delegate:nil
                                         cancelButtonTitle:nil
                                    destructiveButtonTitle:nil
                                         otherButtonTitles:nil];
        [actionSheet setBackgroundColor:[Colors getTertiaryBackgroundColor]];
        
        UIToolbar *pickerToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        [pickerToolbar setBackgroundColor:[Colors getTertiaryBackgroundColor]];
        [pickerToolbar sizeToFit];
        
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        [barItems addObject:flexSpace];
        
        UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDone:)];
        [doneBtn setTintColor:[Colors getTertiaryForegroundColor]];
        [barItems addObject:doneBtn];
        
        [pickerToolbar setItems:barItems animated:YES];

        [actionSheet addSubview:pickerToolbar];
        
        UIPickerView *chPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0.0, 44.0, 320, 200)];
        chPicker.dataSource = self;
        chPicker.delegate = self;
        chPicker.showsSelectionIndicator = YES;
        [actionSheet addSubview:chPicker];
        
        // set to 15% by default
        [chPicker selectRow:1 inComponent:0 animated:NO];
        [chPicker selectRow:5 inComponent:1 animated:NO];
        [chPicker selectRow:0 inComponent:2 animated:NO];
        
        [self setTipBasedOnPicker:chPicker];
    }
}

-(void) pickerDone:(id) sender {
    NSLog(@"Picker done");
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}

-(void) refreshForCurrentBill {
    Bill* bill = [[Checkout getCurrentCheckout] getBill];
    [labelBillOriginalAmount setText:[ViewUtil convertFloatToMoneyString:[bill getAmount]]];
    
    if ([[Checkout getCurrentCheckout] getTipAmount] == 0) {
        [labelTipAmount setText:@""];
    } else {
        [labelTipAmount setText:[ViewUtil convertFloatToMoneyString:[[Checkout getCurrentCheckout] getTipAmount]]];
    }
    [labelBillGrandTotalAmount setText:[ViewUtil convertFloatToMoneyString:[[Checkout getCurrentCheckout] getTotalCheckoutAmount]]];
}

-(void) setTipBasedOnPicker:(UIPickerView*) picker {
    int tens = [picker selectedRowInComponent:0];
    int ones = [picker selectedRowInComponent:1];
    
    int tip = tens*10 + ones;
    bool isPercent = [picker selectedRowInComponent:2] == 0;
    
    NSLog(@"tip: %d,%d,%i",tens,ones,isPercent);
    
    float newTipAmount;
    Bill* bill = [[Checkout getCurrentCheckout] getBill];
    
    if (isPercent) {
        newTipAmount = tip/100.0f*[bill getAmount];
    } else {
        newTipAmount = tip;
    }
    
    NSLog(@"tipamount: %f",newTipAmount);
    
    [[Checkout getCurrentCheckout] setTipAmount:newTipAmount];
    
    [self refreshForCurrentBill];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"picker changed");
    
    [self setTipBasedOnPicker:pickerView];
}

@end
