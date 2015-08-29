//
//  UIImageView+AFNetworking_Blocks.h
//
//  Created by Daniel Blakemore on 6/2/14.
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

#import <AFNetworking/UIImageView+AFNetworking.h>

/**
 *  UIImageView+AFNetworking.h but with blocks.
 */
@interface UIImageView (AFNetworking_Blocks)

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
@end
