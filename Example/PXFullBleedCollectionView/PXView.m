//
//  PXView.m
//  PXFullBleedCollectionView
//
//  Created by Calvin Kern on 6/19/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import "PXCollectionViewHeader.h"

@implementation PXView
{
    NSMutableArray* _constraints;    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        return nil;
    }
    
    _constraints = [NSMutableArray array];
    PXCollectionViewHeader* header = [[PXCollectionViewHeader alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    _collectionView = [[PXFullBleedHeaderCollectionView alloc] init];
    [_collectionView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_collectionView setHeaderView:header];
    [self addSubview:_collectionView];
    
    [self setNeedsUpdateConstraints];
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:_constraints];
    [_constraints removeAllObjects];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_collectionView);
    NSDictionary* metrics = @{};
    
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:metrics views:views]];
    
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:metrics views:views]];
    
    [self addConstraints:_constraints];
    [super updateConstraints];
}

@end
