//
//  PaymentViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-28.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"

@interface ChoosePaymentViewController : SecondaryViewController<UITableViewDataSource,UITableViewDelegate> {
    UITableView* cardTableView;
}
@property (strong, nonatomic) IBOutlet UIView *containerCards;

@end
