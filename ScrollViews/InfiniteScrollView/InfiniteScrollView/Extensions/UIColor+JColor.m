//
//  UIColor+JColor.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/18.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "UIColor+JColor.h"

@implementation UIColor (JColor)
+ (UIColor *)randomColor {
    CGFloat r = ((CGFloat)(arc4random_uniform(255)))/255.0 ;
    CGFloat g = ((CGFloat)(arc4random_uniform(255)))/255.0 ;
    CGFloat b = ((CGFloat)(arc4random_uniform(255)))/255.0 ;
    CGFloat a = ((CGFloat)(arc4random_uniform(10)))/10.0 ;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}
@end
