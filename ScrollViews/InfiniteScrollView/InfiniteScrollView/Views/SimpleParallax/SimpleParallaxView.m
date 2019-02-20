//
//  SimpleParallaxView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "SimpleParallaxView.h"

@interface SimpleParallaxView()
@property (strong, nonatomic) UIImageView *starImageView;
@end

@implementation SimpleParallaxView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _starImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon"]];
        [self insertSubview:_starImageView belowSubview:[self getBuildingContainer]];
    }
    return self;
}

- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    [super setBaseLineMinY:20];
}

- (void)recenterIfNeeded {
    [super recenterIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat starHeight = self.bounds.size.width * 0.1;
    CGFloat maxVisibleX = CGRectGetMaxX(self.bounds);
    CGFloat starCenterX = maxVisibleX - 50;
    CGFloat starCenterY = 40;
    _starImageView.frame = CGRectMake(_starImageView.frame.origin.x, _starImageView.frame.origin.y, starHeight, starHeight);
    _starImageView.center = CGPointMake(starCenterX, starCenterY);
}

- (UIImageView *)getStarImageView {
    return _starImageView;
}

@end
