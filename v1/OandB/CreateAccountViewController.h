//
//  CreateAccountViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-10-01.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateAccountViewController : UITableViewController<UIAlertViewDelegate>

- (IBAction)cancelButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *fieldEmailAddress;
@property (strong, nonatomic) IBOutlet UITextField *fieldPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldPasswordAgain;
- (IBAction)createAccountButtonPressed:(id)sender;

@end
