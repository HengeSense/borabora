//
//  MasterViewController.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "MasterViewController.h"
#import "TabController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

@synthesize labelSubtotal,labelTax,labelTotal;

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
    NSLog(@"Listening");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleTabChanged:)
                                                 name:@"tabChanged"
                                               object:nil];

}

-(void) handleTabChanged:(id)sender {
    [labelSubtotal setText:[NSString stringWithFormat:@"$%.2f",[[TabController getInstance] getSubtotal]]];
    [labelTax setText:[NSString stringWithFormat:@"$%.2f",[[TabController getInstance] getTax]]];
    [labelTotal setText:[NSString stringWithFormat:@"$%.2f",[[TabController getInstance] getTotal]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
