//
//  BillViewController.h
//  Bora
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"

@interface BillViewController : SecondaryViewController<UIPickerViewDelegate,UIPickerViewDataSource> {
    UIActionSheet* actionSheet;
    UILabel *labelBillOriginalAmount;
    UILabel *labelTipAmount;
    UILabel *labelBillGrandTotalAmount;
}

@property (strong, nonatomic) IBOutlet UIButton *buttonAddTip;
@property (strong, nonatomic) IBOutlet UIButton *buttonPayNow;

- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)addTipButtonPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *containerAmounts;
@property (strong, nonatomic) IBOutlet UIImageView *viewLogo;

@end
