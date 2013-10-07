//
//  InventoryCell.h
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InventoryCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *viewImage;
@property (strong, nonatomic) IBOutlet UILabel *labelName;

@end
