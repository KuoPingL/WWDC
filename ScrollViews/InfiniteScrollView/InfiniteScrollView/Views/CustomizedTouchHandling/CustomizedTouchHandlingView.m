//
//  CustomizedTouchHandlingView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "CustomizedTouchHandlingView.h"

@interface CustomizedTouchHandlingView() <UIGestureRecognizerDelegate>
{
    CGPoint touchOffsetFromCenter;
    CGFloat moonTopInset;
    CGFloat moonRightInset;
}
@end

@implementation CustomizedTouchHandlingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customizedInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customizedInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [super getStarImageView].center =
    CGPointMake(CGRectGetMaxX(self.bounds) - moonRightInset, moonTopInset);
}

- (void)customizedInit {
    moonTopInset = 40;
    moonRightInset = 50;
    
    UIImageView *starImageView = [super getStarImageView];
    UIGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleStarPress:)];
    starImageView.userInteractionEnabled = true;
    [starImageView addGestureRecognizer:longPress];
    [super getBuildingContainer].userInteractionEnabled = false;
}

- (void)handleStarPress:(UILongPressGestureRecognizer *)recognizer {
    UIImageView *starImageView = [super getStarImageView];
    CGPoint fingerLocation = [recognizer locationInView:self];
    
    switch ([recognizer state]) {
        case UIGestureRecognizerStateBegan:
        {
            // Remember offset
            touchOffsetFromCenter = CGPointMake(starImageView.center.x - fingerLocation.x, starImageView.center.y - fingerLocation.y);
            // Pull Image to Front
            [self bringSubviewToFront:starImageView];
            // Make it bigger
            // Make it a bit transparent
            [UIView animateWithDuration:0.2 animations:^{
                [starImageView setTransform:CGAffineTransformMakeScale(1.25, 1.25)];
                [starImageView setAlpha:0.75];
            }];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint adjustedCenter = CGPointMake(fingerLocation.x + touchOffsetFromCenter.x, fingerLocation.y + touchOffsetFromCenter.y);
            starImageView.center = adjustedCenter;
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            moonTopInset = starImageView.center.y;
            moonRightInset = CGRectGetMaxX(self.bounds) - starImageView.center.x;
            [UIView animateWithDuration:0.2 animations:^{
                [starImageView setTransform:CGAffineTransformIdentity];
                [starImageView setAlpha:1];
            } completion:^(BOOL finished) {
                [self sendSubviewToBack:starImageView];
            }];
        }
            break;
        default:
            break;
    }
}



@end
