//
//  ScanViewController.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ScanViewController.h"
#import "TabController.h"
#import "QREncoder/QREncoder.h"

@interface ScanViewController ()

@end

@implementation ScanViewController

@synthesize viewCodeContainer,labelAmount;

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
}

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"Getting tab");
    [self refreshFromTab];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) refreshFromTab {
    [self refreshCodeFromTab];
}

-(void) refreshCodeFromTab {

    NSLog(@"Generating code tab");
    double amount = [[TabController getInstance] getTotal];
    
    UIImage* image = [QREncoder encode:[NSString stringWithFormat:@"http://www.pwp.com?m=1&amt=%.2f",amount]];
    
    [viewCodeContainer layer].magnificationFilter = kCAFilterNearest;
	[viewCodeContainer setImage:image];

    [labelAmount setText:[NSString stringWithFormat:@"$%.2f",amount]];
}
- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
