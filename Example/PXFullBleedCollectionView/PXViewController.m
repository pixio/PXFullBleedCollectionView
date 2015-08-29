//
//  PXViewController.m
//  PXFullBleedCollectionView
//
//  Created by Daniel Blakemore on 05/01/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import "PXViewController.h"
#import "PXCollectionViewCell.h"

@interface PXViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation PXViewController

- (PXView*)contentView
{
    return (PXView*)[self view];
}

- (void)loadView
{
    [self setView:[[PXView alloc] init]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"PX Full Bleed Collection View"];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor orangeColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [[[[self contentView] collectionView] collectionView] registerClass:[PXCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [[[self contentView] collectionView] setDelegate:self];
    [[[self contentView] collectionView] setDataSource:self];
}

#pragma mark - UICollectionViewDataSource methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    if (indexPath.row % 2 == 0) {
//        cell.backgroundColor = [UIColor brownColor];
//    } else {
//        cell.backgroundColor = [UIColor orangeColor];
//    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

// Default is 1
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 72;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sections = 4.f;
    int inset = 15;
    CGFloat size = ([collectionView bounds].size.width - (sections * inset)) / sections;
    return CGSizeMake(size, size);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

@end
