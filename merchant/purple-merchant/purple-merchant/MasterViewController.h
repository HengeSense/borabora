//
//  MasterViewController.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelSubtotal;
@property (strong, nonatomic) IBOutlet UILabel *labelTax;
@property (strong, nonatomic) IBOutlet UILabel *labelTotal;

@end
