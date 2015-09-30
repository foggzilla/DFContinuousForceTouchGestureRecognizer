//
//  ViewController.m
//  DFContinuousForceTouchGestureRecognizer
//
//  Created by Daniel Fogg on 9/30/15.
//  Copyright © 2015 Daniel J Fogg. All rights reserved.
//

#import "ViewController.h"
#import "DFContinuousForceTouchGestureRecognizer.h"

@interface ViewController ()<DFContinuousForceTouchDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) DFContinuousForceTouchGestureRecognizer* imageForceTouchRecognizer;
@property (strong, nonatomic) DFContinuousForceTouchGestureRecognizer* buttonForceTouchRecognizer;
@property (strong, nonatomic) UITapGestureRecognizer* tapGestureRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageForceTouchRecognizer = [[DFContinuousForceTouchGestureRecognizer alloc] init];
    _imageForceTouchRecognizer.timeout = 0.5f;
    _imageForceTouchRecognizer.forceTouchDelay = 0.2f;
    _imageForceTouchRecognizer.baseForceTouchPressure = 3.0f;
    _imageForceTouchRecognizer.triggeringForceTouchPressure = 6.0f;
    _imageForceTouchRecognizer.forceTouchDelegate = self;
    
    _buttonForceTouchRecognizer = [[DFContinuousForceTouchGestureRecognizer alloc] init];
    _buttonForceTouchRecognizer.timeout = 0.5f;
    _buttonForceTouchRecognizer.forceTouchDelay = 0.2f;
    _buttonForceTouchRecognizer.baseForceTouchPressure = 3.0f;
    _buttonForceTouchRecognizer.triggeringForceTouchPressure = 6.0f;
    _buttonForceTouchRecognizer.forceTouchDelegate = self;
    
    //here to demonstrate how this works alonside a tap gesture recognizer
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    [self.imageView addGestureRecognizer:_tapGestureRecognizer];
    [self.imageView addGestureRecognizer:_imageForceTouchRecognizer];
    
    [self.button addGestureRecognizer:_buttonForceTouchRecognizer];
    [self.button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma UIButton target selector

- (void) buttonTapped:(id)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:@"Button Tap" message:@"YEAH!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    });
}

#pragma mark -
#pragma UITapGestureRecognizer target selector

- (void) tapped:(id)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:@"Image Tap" message:@"YEAH!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    });
}

#pragma mark -
#pragma UIContinuousForceTouchDelegate

//required
- (void) forceTouchRecognized:(DFContinuousForceTouchGestureRecognizer*)recognizer {
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformIdentity;
        [self.imageView setNeedsDisplay];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@"Force Touch Image" message:@"YEAH!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        });
    } else {
        self.button.transform = CGAffineTransformIdentity;
        [self.button setNeedsDisplay];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@"Force Touch Button" message:@"YEAH!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        });
    }
}

//optional
- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didStartWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
    CGFloat transformDelta = 1.0f + ((force/maxForce) / 3.0f);
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
        [self.imageView setNeedsDisplay];
    } else {
        self.button.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
        [self.button setNeedsDisplay];
    }
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didMoveWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
    CGFloat transformDelta = 1.0f + ((force/maxForce) / 3.0f);
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
        [self.imageView setNeedsDisplay];
    } else {
        self.button.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
        [self.button setNeedsDisplay];
    }
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didCancelWithForce:(CGFloat)force maxForce:(CGFloat)maxForce  {
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformIdentity;
        [self.imageView setNeedsDisplay];
    } else {
        self.button.transform = CGAffineTransformIdentity;
        [self.button setNeedsDisplay];
    }
    
}

- (void) forceTouchRecognizer:(DFContinuousForceTouchGestureRecognizer*)recognizer didEndWithForce:(CGFloat)force maxForce:(CGFloat)maxForce  {
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformIdentity;
        [self.imageView setNeedsDisplay];
    } else {
        self.button.transform = CGAffineTransformIdentity;
        [self.button setNeedsDisplay];
    }
}

- (void) forceTouchDidTimeout:(DFContinuousForceTouchGestureRecognizer*)recognizer {
    if(recognizer == _imageForceTouchRecognizer) {
        self.imageView.transform = CGAffineTransformIdentity;
        [self.imageView setNeedsDisplay];
    } else {
        self.button.transform = CGAffineTransformIdentity;
        [self.button setNeedsDisplay];
    }
}


@end
