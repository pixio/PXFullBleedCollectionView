//
//  PXCollectionViewHeader.m
//  PXFullBleedCollectionView
//
//  Created by Calvin Kern on 6/19/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXCollectionViewHeader.h"

#import <PXImageView/PXImageView.h>

@implementation PXCollectionViewHeader
{
    NSMutableArray* _constraints;
    
    UILabel* _foregroundLabel;
    PXImageView* _backgroundImage;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        return nil;
    }
    
    _constraints = [NSMutableArray array];
    
    [self setClipsToBounds:TRUE];
    
    _backgroundImage = [[PXImageView alloc] init];
    [_backgroundImage setContentMode:PXContentModeSides];
    [_backgroundImage setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_backgroundImage setImage:[UIImage imageNamed:@"apple stand"]];
    [self addSubview:_backgroundImage];
    
    _foregroundLabel = [[UILabel alloc] init];
    [_foregroundLabel setTextColor:[UIColor whiteColor]];
    [_foregroundLabel setFont:[UIFont systemFontOfSize:14]];
    [_foregroundLabel setTextAlignment:NSTextAlignmentCenter];
    [_foregroundLabel setText:@"There's always money in the...apple stand?"];
    [_foregroundLabel setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.5f]];
    [_foregroundLabel setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_foregroundLabel];
    
    [self setNeedsUpdateConstraints];
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:_constraints];
    [_constraints removeAllObjects];

    NSDictionary* views = NSDictionaryOfVariableBindings(_backgroundImage, _foregroundLabel);
    NSDictionary* metrics = @{};
    
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backgroundImage]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backgroundImage]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_foregroundLabel]|" options:0 metrics:metrics views:views]];
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:_foregroundLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    
    [self addConstraints:_constraints];
    [super updateConstraints];
}

- (CGFloat)maxHeight
{
    return 220;
}

- (CGFloat)minHeight
{
    return 66;
}

@end
