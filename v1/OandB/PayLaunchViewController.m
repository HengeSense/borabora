//
//  PayLaunchViewController.m
//  Bora
//
//  Created by Marc Fiume on 2013-09-27.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "PayLaunchViewController.h"
#import "Bill.h"
#import "Checkout.h"

@interface PayLaunchViewController ()

@end

@implementation PayLaunchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
            }
    return self;
}

-(void) initCodeReader {
    codeReader = [ZBarReaderViewController new];
    codeReader.readerDelegate=self;
    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = codeReader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initCodeReader];
    
    Bill* bill = [[Bill alloc] initWithMerchantID:1 Amount:23.65f];
    [Checkout startNewCheckout:bill];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startScanning:(id)sender {
    
    NSLog(@"Scanning..");
    [self presentViewController:codeReader animated:YES completion:nil];
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    //  get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // just grab the first barcode
        break;
    
    // showing the result on textview
    
    //[labelAmount setText:symbol.data];
    
    //resultImageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];

    // dismiss the controller
    [reader dismissViewControllerAnimated:NO completion:nil];
    
    NSString* data = symbol.data;
    NSArray *components = [data componentsSeparatedByString:@"="];
    double amount = [[components lastObject] doubleValue];
    
    Bill* bill = [[Bill alloc] initWithMerchantID:1 Amount:amount];
    [Checkout startNewCheckout:bill];

    NSLog(@"Trying to push pay nav controller");
    NSLog(@"Read from scanner %@",symbol.data);
    
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"PayNavigationController"];
    
    [self.tabBarController presentViewController:controller animated:YES completion:nil];
    //[self.tabBarController pres pushViewController:controller animated:YES];
}

@end
