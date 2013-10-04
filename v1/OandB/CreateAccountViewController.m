//
//  CreateAccountViewController.m
//  Purple
//
//  Created by Marc Fiume on 2013-10-01.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "ResponseAdapter.h"
#import "AccountAdapter.h"
#import "InternalCode.h"
#import "NetUtils.h"
#import "CryptoUtils.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

@synthesize fieldEmailAddress,fieldPassword,fieldPasswordAgain;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createAccountButtonPressed:(id)sender {
    
    NSString* email = fieldEmailAddress.text;
    NSString* password = [CryptoUtils md5:fieldPassword.text];
    
    [AccountAdapter createAccountWithEmail:email Password:password Handler:
     ^(NSURLResponse *response, NSData *data, NSError *error) {
         
         if ([NetUtils wasRequestSuccessful:response]) {
             UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Welcome to Purple" message:@"Check your email for more information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
             [alert show];
             
         } else {
             
             int internalCode = [NetUtils getInternalErrorCodeFromData:data];
             
             NSString* errorMessage;
             
             switch (internalCode) {
                 case kBADUSERNAME:
                     errorMessage = @"Invalid email address";
                     break;
                 case kBADPASSWORD:
                     errorMessage = @"Invalid password";
                     break;
                 case kUSEREXISTS:
                     errorMessage = @"User exists";
                     break;
                 default:
                     errorMessage = [NSString stringWithFormat:@"Unknown error: %i",internalCode];
                     
             }
             
             [[[UIAlertView alloc] initWithTitle:@"Uh oh" message:errorMessage delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
         }
     }];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex              {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
