//
//  UIImageView+AFNetworking_Blocks.m
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

#import "UIImageView+AFNetworking_Blocks.h"
#import <AFNetworking/AFHTTPRequestOperation.h>

@implementation UIImageView (AFNetworking_Blocks)

- (void)setImageWithURL:(NSURL *)url completion:(void(^)(UIImageView * imageView))completion
{
    [self setImageWithURL:url placeholderImage:nil forceUpdate:FALSE completion:completion];
}

- (void)setImageWithURL:(NSURL *)url forceUpdate:(BOOL)forceUpdate completion:(void (^)(UIImageView *))completion
{
    [self setImageWithURL:url placeholderImage:nil forceUpdate:forceUpdate completion:completion];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(void(^)(UIImageView * imageView))completion
{
    [self setImageWithURL:url placeholderImage:placeholderImage forceUpdate:FALSE completion:completion];
}

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
            forceUpdate:(BOOL)forceUpdate
             completion:(void (^)(UIImageView *))completion
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    if (forceUpdate == TRUE)
    {
        [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    }
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf setImage:image];
        if (completion) {
            completion(strongSelf);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@", error);
        if (completion) {
            completion(strongSelf);
        }
    }];
}

@end
