//
//  ChooseAccountViewController.h
//  Purple
//
//  Created by Marc Fiume on 2013-09-30.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondaryViewController.h"

@interface ChooseAccountViewController : SecondaryViewController<UITableViewDataSource,UITableViewDelegate> {
    UITableView* tableView;
}
@property (strong, nonatomic) IBOutlet UIView *container;

@end
