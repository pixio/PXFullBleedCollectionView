//
//  PXView.h
//  PXFullBleedCollectionView
//
//  Created by Calvin Kern on 6/19/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PXFullBleedCollectionView/PXFullBleedHeaderCollectionView.h>

@interface PXView : UIView

@property (nonatomic, readonly) PXFullBleedHeaderCollectionView* collectionView;

@end
