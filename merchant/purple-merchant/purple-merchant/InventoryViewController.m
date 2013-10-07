//
//  InventoryViewController.m
//  purple-merchant
//
//  Created by Marc Fiume on 2013-10-06.
//  Copyright (c) 2013 Marc Fiume. All rights reserved.
//

#import "InventoryViewController.h"
#import "InventoryCell.h"
#import "InventoryController.h"
#import "InventoryItem.h"
#import "InventorySearchHeader.h"
#import "TabController.h"

#import <QuartzCore/QuartzCore.h>

@interface InventoryViewController ()

@end

@implementation InventoryViewController

static UIImage *image;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.mcdonalds.com/content/dam/McDonalds/item/mcdonalds-Big-Mac.png"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data Sources

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[[InventoryController getInstance] getInventory] count];
}


// The cell that is returned must be retrieved from a call to - dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    InventoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InventoryCell" forIndexPath:indexPath];
    //cell.imageView.image = [UIImage imageNamed:self.truckImages[0]];
    
    InventoryItem* m = [[[InventoryController getInstance] getInventory] objectAtIndex:indexPath.row];
    
    UIImage *truckImage = [[UIImage alloc] init];
    truckImage = image;
    cell.viewImage.image = [m getImage];
    [cell.labelName setText:[m getName]];
    
    cell.layer.cornerRadius = 5;
    cell.layer.masksToBounds = YES;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        InventorySearchHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"InventorySearchHeader" forIndexPath:indexPath];
        reusableview = headerView;
    }

    return reusableview;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (void)collectionView:(UICollectionView *)colView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
}

- (void)collectionView:(UICollectionView *)colView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    InventoryItem* item = [[[InventoryController getInstance] getInventory] objectAtIndex:indexPath.row];
    NSLog(@"Selected %@",[item getName]);
    [[TabController getInstance] addToTab:item];
}

@end
