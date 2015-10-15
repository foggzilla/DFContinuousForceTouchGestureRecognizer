# DFContinuousForceTouchGestureRecognizer

[![CI Status](http://img.shields.io/travis/Daniel Fogg/DFContinuousForceTouchGestureRecognizer.svg?style=flat)](https://travis-ci.org/Daniel Fogg/DFContinuousForceTouchGestureRecognizer)
[![Version](https://img.shields.io/cocoapods/v/DFContinuousForceTouchGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/DFContinuousForceTouchGestureRecognizer)
[![License](https://img.shields.io/cocoapods/l/DFContinuousForceTouchGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/DFContinuousForceTouchGestureRecognizer)
[![Platform](https://img.shields.io/cocoapods/p/DFContinuousForceTouchGestureRecognizer.svg?style=flat)](http://cocoapods.org/pods/DFContinuousForceTouchGestureRecognizer)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DFContinuousForceTouchGestureRecognizer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DFContinuousForceTouchGestureRecognizer"
```

## Author

Daniel Fogg

## License

DFContinuousForceTouchGestureRecognizer is available under the MIT license. See the LICENSE file for more info.


# DFContinuousForceTouchGestureRecognizer
iOS Force Touch gesture recognizer that will stream force updates to the delegate for the user's finger pressure changes. It gives you the capability to detect force touch and monitor pressure changes on a view in order to adapt your ui for an added dimension of interaction.

This is only useful for running on a physical device that supports force touch.

To see this in action run the sample program on a device that supports force touch and press on the elephant with force.

## Usage

Create a `DFContinuousForceTouchGestureRecognizer`, add it to a view like any other gesture recognizer:

DFContinuousForceTouchGestureRecognizer* forceTouchRecognizer = [[DFContinuousForceTouchGestureRecognizer alloc] init];
forceTouchRecognizer.forceTouchDelegate = self;
[myView addGestureRecognizer:forceTouchRecognizer];

...

Implement the `DFContinuousForceTouchDelegate` protocol to receive updates as the user's force changes:

#pragma DFContinuousForceTouchDelegate

- (void) forceTouchRecognized:(DFContinuousForceTouchGestureRecognizer*)recognizer {
//trigger force touch action
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didStartWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
//do something cool
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didMoveWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
//do something cool
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didCancelWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
//reset cool effects
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didEndWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
//reset cool effects
}

- (void) forceTouchDidTimeout:(DFContinuousForceTouchGestureRecognizer*)recognizer {
//reset cool effects
}

Customizing the feel of it can be done through these configuration properties:

//how to long to tracking force touches before calling forceTouchRecognized
forceTouchRecognizer.forceTouchDelay = 0.2f;    

//make it moderately hard to start tracking force touches
forceTouchRecognizer.baseForceTouchPressure = 3.0f;       

//make it really hard to trigger the force touches
forceTouchRecognizer.triggeringForceTouchPressure = 6.0f; 

See `ViewController.m` for sample usage