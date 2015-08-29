//
//  PXImageView.m
//
//  Created by Daniel Blakemore on 4/18/14.
//
//  Copyright (c) 2015 Pixio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PXImageView.h"

#import <UIImageView_AFNetworking-Blocks/UIImageView+AFNetworking_Blocks.h>

static void* frImageViewContext = &frImageViewContext;

@implementation PXImageView
{
    UIImageView * _backingImageView;
    
    NSMutableArray * _constraints;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _contentMode = PXContentModeFill;
        _constraints = [NSMutableArray array];
        [self setClipsToBounds:TRUE];
        
        _backingImageView = [UIImageView new];
        [_backingImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_backingImageView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
        [self addSubview:_backingImageView];
        
        [_backingImageView addObserver:self forKeyPath:@"image" options:0 context:frImageViewContext];
    }
    return self;
}

- (void)dealloc
{
    [_backingImageView removeObserver:self forKeyPath:@"image" context:frImageViewContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context != frImageViewContext)
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    
    if ([keyPath isEqualToString:@"image"])
    {
        // Update constraints when the image changes and the content mode dictates that it is needed
        switch (_contentMode) {
            case PXContentModeSides:
                [self setNeedsUpdateConstraints];
                break;
            default:
                break;
        }
    }
}


- (UIImage *)image
{
    return [_backingImageView image];
}

- (void)setImage:(UIImage *)image
{
    [_backingImageView setImage:image];
    
    // update aspect ratio constraints
    [self updateConstraints];
}

- (void)setContentMode:(PXContentMode)contentMode
{
    _contentMode = contentMode;
    
    switch (_contentMode) {
        case PXContentModeFill: {
            // cheat and use the imageview for this
            [_backingImageView setContentMode:UIViewContentModeScaleAspectFill];
            break;
        }
        default:
            // most cases use this
            [_backingImageView setContentMode:UIViewContentModeScaleAspectFit];
            break;
    }
    
    // need to change constraints based on content mode.
    [self updateConstraints];
}

- (void)updateConstraints
{
    // out with the old
    [self removeConstraints:_constraints];
    [_constraints removeAllObjects];
    
    // in with the new
    NSDictionary* views = NSDictionaryOfVariableBindings(_backingImageView);
    NSDictionary* metrics = @{};
    
    switch (_contentMode) {
        case PXContentModeFit:
        case PXContentModeFill: {
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            break;
        }
        case PXContentModeLeft: {
            // let the right move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backingImageView]" options:0 metrics:metrics views:views]];
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            break;
        }
        case PXContentModeRight: {
            // let the left move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            break;
        }
        case PXContentModeTop: {
            // let the bottom move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backingImageView]" options:0 metrics:metrics views:views]];
            break;
        }
        case PXContentModeBottom: {
            // let the top move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_backingImageView]|" options:0 metrics:metrics views:views]];
            break;
        }
        case PXContentModeSides: {
            // let the top and bottom move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObject:[NSLayoutConstraint constraintWithItem:_backingImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
            break;
        }
            
        case PXContentModeTopBottom: {
            // let the sides move freely
            [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_backingImageView]|" options:0 metrics:metrics views:views]];
            [_constraints addObject:[NSLayoutConstraint constraintWithItem:_backingImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
            break;
        }
            
        default:
            break;
    }
    
    if ([self image] && _contentMode != PXContentModeFill && _contentMode != PXContentModeFit) {
        NSAssert([[self image] size].width > 1, @"invalid image width");
        NSAssert([[self image] size].height > 1, @"invalid image height");
        
        CGFloat aspectRatio = [[self image] size].width / [[self image] size].height;
        
        [_constraints addObject:[NSLayoutConstraint constraintWithItem:_backingImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_backingImageView attribute:NSLayoutAttributeWidth multiplier:(1.0f / aspectRatio) constant:0.0f]];
    }
    
    [self addConstraints:_constraints];
    
    [super updateConstraints];
}

- (void)setImageWithURL:(NSURL *)url
{
    [_backingImageView setImageWithURL:url];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    [_backingImageView setImageWithURL:url placeholderImage:placeholderImage];
}

- (void)setImageWithURL:(NSURL *)url completion:(void(^)(UIImageView * imageView))completion
{
    [_backingImageView setImageWithURL:url completion:completion];
}

- (void)setImageWithURL:(NSURL *)url forceUpdate:(BOOL)forceUpdate completion:(void (^)(UIImageView *))completion
{
    [_backingImageView setImageWithURL:url forceUpdate:forceUpdate completion:completion];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(void (^)(UIImageView *))completion
{
    [_backingImageView setImageWithURL:url placeholderImage:placeholderImage completion:completion];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage forceUpdate:(BOOL)forceUpdate completion:(void(^)(UIImageView * imageView))completion
{
    [_backingImageView setImageWithURL:url placeholderImage:placeholderImage forceUpdate:forceUpdate completion:completion];
}

- (void)cancelImageRequestOperation
{
    [_backingImageView cancelImageRequestOperation];
}

@end
