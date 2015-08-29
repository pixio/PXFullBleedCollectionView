//
//  PXFullBleedHeaderView.h
//
//  Created by Daniel Blakemore on 5/23/14.
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
 *  This is meant to be an abstract class. This class should not be instantiated.
 *  A view with an externaly-adjustable layout height and an instance-specified desired max height.
 */
@interface PXFullBleedHeaderView : UIView

// This is meant to be an abstract class. This class should not be instantiated.
- (id) init __attribute__((unavailable("init not available as this class is meant to be an abstract class. Please subclass this class.")));
+ (id) new __attribute__((unavailable("new not available as this class is meant to be an abstract class. Please subclass this class.")));


/**
 *  The max height this view wants for layout.
 */
@property (nonatomic, readonly) CGFloat maxHeight;

/**
 *  The min height this view wants for layout.
 */
@property (nonatomic, readonly) CGFloat minHeight;

@end
