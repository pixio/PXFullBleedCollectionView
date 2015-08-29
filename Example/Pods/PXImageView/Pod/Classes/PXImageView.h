//
//  PXImageView.h
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

#import <UIKit/UIKit.h>

/**
 *  More useful content modes than those provided by uiview.
 */
typedef NS_ENUM(NSInteger, PXContentMode) {
    /**
     *  Fill the imageview with the image from the center (same as UIView).
     *  Excess is clipped.
     */
    PXContentModeFill,
    /**
     *  Fit the image within the bounds of the imageview (same as UIView).
     *  Unused space is blank (background color changed)
     */
    PXContentModeFit,
    /**
     *  Scale the image keeping it attached to the top, right, and left edges.
     *  The bottom edge is free to move up and down as the image and view aspect
     *  ratios dictate.
     */
    PXContentModeTop,
    /**
     *  Scale the image keeping it attached to the left, top, and bottom edges.
     *  The right edge is free to move sideways as the image and view aspect
     *  ratios dictate.
     */
    PXContentModeLeft,
    /**
     *  Scale the image keeping it attached to the right, top, and bottom edges.
     *  The left edge is free to move sideways as the image and view aspect
     *  ratios dictate.
     */
    PXContentModeRight,
    /**
     *  Scale the image keeping it attached to the bottom, right, and left edges.
     *  The top edge is free to move up and down as the image and view aspect
     *  ratios dictate.
     */
    PXContentModeBottom,
    /**
     *  Scale the image keeping it centered and attached to the right and left edges.
     *  The top and bottom edges move up and down depending on the image and view
     *  aspect ratios.
     */
    PXContentModeSides,
    /**
     *  Scale the image keeping it centered and attached to the top and bottom edges.
     *  The left and right edges move side to side depending on the image and view
     *  aspect ratios.
     */
    PXContentModeTopBottom,
};

/**
 *  An imageview with better content modes.
 */
@interface PXImageView : UIView

/**
 * The image in the imageview.
 */
@property (nonatomic, retain) UIImage * image;

/**
 * A content mode like the ones from apple, but better suited to fitting three of four sides.
 */
@property (nonatomic) PXContentMode contentMode;

/**
 * The backing imageview for this view.
 */
//@property UIImageView * backingImageView;

/**
 *  Calls afnetworking setImageWithURL.
 *
 *  @param url        the url for the image
 */
- (void)setImageWithURL:(NSURL *)url;

/**
 *  Calls afnetworking setImageWithURL:placeholderImage
 *
 *  @param url              the url for the image
 *  @param placeholderImage image to use as placeholder until load finishes
 */
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

/**
 *  Calls afnetworking setImageWithURL and calls completion when done.
 *
 *  @param url        the url for the image
 *  @param completion completion to call when done
 */
- (void)setImageWithURL:(NSURL *)url completion:(void(^)(UIImageView * imageView))completion;

/**
 *  Calls afnetworking setImageWithURL and calls completion when done.
 *
 *  @param url         the url for the image
 *  @prarm forceUpdate whether the image should be force updated, ignoring the cache
 *  @param completion  completion to call when done
 */
- (void)setImageWithURL:(NSURL *)url forceUpdate:(BOOL)forceUpdate completion:(void(^)(UIImageView * imageView))completion;

/**
 *  Calls afnetworking setImageWithURL:placeholderImage and calls completion when done
 *
 *  @param url              the url for the image
 *  @param placeholderImage image to use as placeholder until load finishes
 *  @param completion       completion to call when done
 */
- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
             completion:(void(^)(UIImageView * imageView))completion;

/**
 *  Calls afnetworking setImageWithURL:placeholderImage and calls completion when done
 *
 *  @param url              the url for the image
 *  @param placeholderImage image to use as placeholder until load finishes
 *  @prarm forceUpdate      whether the image should be force updated, ignoring the cache
 *  @param completion       completion to call when done
 */
- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
            forceUpdate:(BOOL)forceUpdate
             completion:(void(^)(UIImageView * imageView))completion;

/**
 Cancels any executing image operation for the receiver, if one exists.
 */
- (void)cancelImageRequestOperation;

@end
