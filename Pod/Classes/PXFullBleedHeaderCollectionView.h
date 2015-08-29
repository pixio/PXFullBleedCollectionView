//
//  PXFullBleedHeaderCollectionView.h
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

#import "PXFullBleedHeaderView.h"

/**
 *  A view containing a collectionview with a setable header view.
 *  When the collectionview is scrolled all the way to the top, the header view is fully visible.
 *  Once scrolling begins, before the collectionview is allowed to scroll, the collectionview slides
 *  up over the area the headerview was taking up.  As it is doing this, it notifies the header view
 *  of how much space is being removed (so that it can adjust its own layout appropriately).
 */
@interface PXFullBleedHeaderCollectionView : UIView <UIGestureRecognizerDelegate, UICollectionViewDelegate>

/**
 *  The collectionview shown in this view.  Do not set the delegate property of this collectionview.
 *  Instead, set the delegate property of this PXFullBleedHeaderCollectionView so that scroll events 
 *  can be intercepted.
 */
@property (nonatomic, readonly) UICollectionView * collectionView;

/**
 *  The headerview at the top of the collectionview.  This view can contain anything including controls.
 *  The headerview is responsible for managing its own layout in response to resizing.
 *  Setting the headerview resets the collectionview's contentoffset.
 */
@property (nonatomic) PXFullBleedHeaderView * headerView;

/**
 *  The delegate for the collectionview.  All non scroll-related delegate methods will be passed through.
 *  All scroll events will be intercepted and dealt with and then passed through.
 */
@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;

/**
 *  The data source for the collectionview.  Wraps the collection view's getter/setter for convenience.
 */
@property (nonatomic, assign) id<UICollectionViewDataSource> dataSource;

@end
