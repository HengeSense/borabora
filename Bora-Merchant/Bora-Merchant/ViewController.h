//
//  ViewController.h
//  Bora-Merchant
//
//  Created by Marc Fiume on 2013-09-22.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *viewCodeContainer;
- (IBAction)doGenerate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *fieldAmount;

@end
