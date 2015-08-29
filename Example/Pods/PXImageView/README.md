# PXImageView

[![Version](https://img.shields.io/cocoapods/v/PXImageView.svg?style=flat)](http://cocoapods.org/pods/PXImageView)
[![License](https://img.shields.io/cocoapods/l/PXImageView.svg?style=flat)](http://cocoapods.org/pods/PXImageView)
[![Platform](https://img.shields.io/cocoapods/p/PXImageView.svg?style=flat)](http://cocoapods.org/pods/PXImageView)

## Usage

Use it just like a normal `UIImageView`.  The functional difference is the content modes. 

`PXImageView` provides content modes that are likely more useful for you than what apple provides.  It preserves the staples:

* UIViewContentModeScaleAspectFit -> PXContentModeFit
* UIViewContentModeScaleAspectFill -> PXContentModeFill

as well as providing several very useful ones (note in all these images, the blue imageview is resizing, not zooming):


* PXContentModeTop:  
  Scale the image keeping it attached to the top, right, and left edges.
  The bottom edge is free to move up and down as the image and view aspect
  ratios dictate.  
  <video src="PXContentModeTop.webm" loop=true></video>

* PXContentModeLeft:  
  Scale the image keeping it attached to the left, top, and bottom edges.
  The right edge is free to move sideways as the image and view aspect
  ratios dictate.  
  <video src="PXContentModeLeft.webm" loop=true></video>
 
* PXContentModeRight:  
  Scale the image keeping it attached to the right, top, and bottom edges.
  The left edge is free to move sideways as the image and view aspect
  ratios dictate.  
  <video src="PXContentModeRight.webm" loop=true></video>

* PXContentModeBottom:  
  Scale the image keeping it attached to the bottom, right, and left edges.
  The top edge is free to move up and down as the image and view aspect
  ratios dictate.  
  <video src="PXContentModeBottom.webm" loop=true></video>

* PXContentModeSides:  
  Scale the image keeping it centered and attached to the right and left edges.
  The top and bottom edges move up and down depending on the image and view
  aspect ratios.  
  <video src="PXContentModeSides.webm" loop=true></video>

* PXContentModeTopBottom:  
  Scale the image keeping it centered and attached to the top and bottom edges.
  The left and right edges move side to side depending on the image and view
  aspect ratios.  
  <video src="PXContentModeTopBottom.webm" loop=true></video>


To run the example project and see all these content modes in action, clone the repo, and run `pod install` from the Example directory first.

## Installation

PXImageView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PXImageView"
```

## Author

Daniel Blakemore, DanBlakemore@gmail.com

## License

PXImageView is available under the MIT license. See the LICENSE file for more info.
