# PXFullBleedCollectionView

[![Version](https://img.shields.io/cocoapods/v/PXFullBleedCollectionView.svg?style=flat)](http://cocoapods.org/pods/PXFullBleedCollectionView)
[![License](https://img.shields.io/cocoapods/l/PXFullBleedCollectionView.svg?style=flat)](http://cocoapods.org/pods/PXFullBleedCollectionView)
[![Platform](https://img.shields.io/cocoapods/p/PXFullBleedCollectionView.svg?style=flat)](http://cocoapods.org/pods/PXFullBleedCollectionView)

## Usage

1. Implement a subclass of `PXFullBleedHeaderView`  
   The important (and only) features of this class are the `maxHeight` and `minHeight` properties.  These allow your subclass to determine how tall the header should be when scrolled all the way to the top of the collection view, and how short to make it as scrolling moves down.
2. Make a `UIViewController` and a custom view subclass with a `PXFullBleedHeaderCollectionView` in it.  
   This collection view has a `headerView` property for an instance of your header view.  Then, you add yourself as the datasource and delegate of the `PXFullBleedHeaderCollectionView` and you're ready to go.
3. Make sure your content looks good as it resizes.

Your collection views can now look this good:

![Collection view with resizing header](fullbleed.gif)

<sup>(Note the image centering is not built in by default. See PXImageView for details.)</sup>

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

PXFullBleedCollectionView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PXFullBleedCollectionView"
```

## Author

Daniel Blakemore, DanBlakemore@gmail.com

## License

PXFullBleedCollectionView is available under the MIT license. See the LICENSE file for more info.
