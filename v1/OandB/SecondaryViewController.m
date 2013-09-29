//
//  SecondaryViewController.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "SecondaryViewController.h"
#import "Colors.h"

@interface SecondaryViewController ()

@end

@implementation SecondaryViewController

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
    
    NSLog(@"Secondary loaded");
    [self.view setBackgroundColor:[Colors getSecondaryBackgroundColor]];
    [self setNeedsStatusBarAppearanceUpdate];

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    NSLog(@"Style secondary");
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
