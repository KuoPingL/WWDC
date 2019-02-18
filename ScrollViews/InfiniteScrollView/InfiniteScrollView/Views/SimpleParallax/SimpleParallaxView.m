//
//  SimpleParallaxView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/19.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "SimpleParallaxView.h"

@interface SimpleParallaxView()
@property (strong, nonatomic) UIView *backgroundContainer;
@end

@implementation SimpleParallaxView

- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
}

- (void)recenterIfNeeded {
    [super recenterIfNeeded];
    
}

@end
