//
//  ViewController.m
//  Bora-Merchant
//
//  Created by Marc Fiume on 2013-09-22.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "ViewController.h"
#import "QREncoder/QREncoder.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize viewCodeContainer;
@synthesize fieldAmount;

int kPadding = 20;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doGenerate:(id)sender {
    
    [fieldAmount endEditing:YES];
    
    for (UIView *view in viewCodeContainer.subviews) {
        [view removeFromSuperview];
    }
    
    NSString* amountString =[fieldAmount text];
    
    UIImage* image = [QREncoder encode:[NSString stringWithFormat:@"%@%@", @"http://www.bora.com?amount=",amountString]];
    
	UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    CGFloat qrSize = self.view.bounds.size.width - kPadding * 2;
	imageView.frame = CGRectMake(kPadding, (viewCodeContainer.bounds.size.height - qrSize) / 2,
                                 qrSize, qrSize);
	[imageView layer].magnificationFilter = kCAFilterNearest;
    
	[viewCodeContainer addSubview:imageView];
}
@end
