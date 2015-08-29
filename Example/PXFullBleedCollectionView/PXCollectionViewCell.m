//
//  PXCollectionViewCell.m
//  PXFullBleedCollectionView
//
//  Created by Calvin Kern on 6/22/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXCollectionViewCell.h"

@implementation PXCollectionViewCell
{
    UILabel* _label;
    UIImageView* _imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (!self) {
        return nil;
    }
    
    _imageView = [[UIImageView alloc] init];
    [_imageView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_imageView setImage:[UIImage imageNamed:@"apple"]];
    [_imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:_imageView];

    _label = [[UILabel alloc] init];
    [_label setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_label setText:@"Apple"];
    [_label setAdjustsFontSizeToFitWidth:TRUE];
    [_label setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_label];

    [self setNeedsUpdateConstraints];
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:[self constraints]];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_label, _imageView);
    NSDictionary* metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_imageView]|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_label]|" options:0 metrics:metrics views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_imageView][_label]|" options:0 metrics:metrics views:views]];
    
    [super updateConstraints];
}

@end
