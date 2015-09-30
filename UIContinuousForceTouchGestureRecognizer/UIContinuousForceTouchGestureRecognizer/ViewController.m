//
//  ViewController.m
//  UIContinuousForceTouchGestureRecognizer
//
//  Created by Daniel Fogg on 9/30/15.
//  Copyright © 2015 Daniel J Fogg. All rights reserved.
//

#import "ViewController.h"
#import "UIContinuousForceTouchGestureRecognizer.h"

@interface ViewController ()<UIContinuousForceTouchDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIContinuousForceTouchGestureRecognizer* forceTouchRecognizer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _forceTouchRecognizer = [[UIContinuousForceTouchGestureRecognizer alloc] init];
    _forceTouchRecognizer.timeout = 0.5f;
    _forceTouchRecognizer.forceTouchDelay = 0.2f;
    _forceTouchRecognizer.baseForceTouchPressure = 3.0f;
    _forceTouchRecognizer.triggeringForceTouchPressure = 6.0f;
    _forceTouchRecognizer.forceTouchDelegate = self;
    [self.imageView addGestureRecognizer:_forceTouchRecognizer];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma UIForceTouchDelegate

- (void) forceTouchDidStartWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
    CGFloat transformDelta = 1.0f + ((force/maxForce) / 3.0f);
    self.imageView.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
    [self.imageView setNeedsDisplay];
}

- (void) forceTouchDidMoveWithForce:(CGFloat)force maxForce:(CGFloat)maxForce {
    CGFloat transformDelta = 1.0f + ((force/maxForce) / 3.0f);
    self.imageView.transform = CGAffineTransformMakeScale(transformDelta, transformDelta);
    [self.imageView setNeedsDisplay];
}

- (void) forceTouchDidCancelWithForce:(CGFloat)force maxForce:(CGFloat)maxForce  {
    self.imageView.transform = CGAffineTransformIdentity;
    [self.imageView setNeedsDisplay];
}

- (void) forceTouchDidEndWithForce:(CGFloat)force maxForce:(CGFloat)maxForce  {
    self.imageView.transform = CGAffineTransformIdentity;
    [self.imageView setNeedsDisplay];
}

- (void) forceTouchDidTimeout {
    self.imageView.transform = CGAffineTransformIdentity;
    [self.imageView setNeedsDisplay];
}

- (void) forceTouchRecognized {
    self.imageView.transform = CGAffineTransformIdentity;
    [self.imageView setNeedsDisplay];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc] initWithTitle:@"Force Touch" message:@"YEAH!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    });
}

@end
