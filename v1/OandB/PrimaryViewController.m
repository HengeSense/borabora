//
//  PrimaryViewController.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "PrimaryViewController.h"
#import "Colors.h"

@interface PrimaryViewController ()

@end

@implementation PrimaryViewController

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
    
    [self.view setBackgroundColor:[Colors getPrimaryBackgroundColor]];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    NSLog(@"Style primary");
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
