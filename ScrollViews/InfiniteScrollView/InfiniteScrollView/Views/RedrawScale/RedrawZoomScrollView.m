//
//  RedrawZoomScrollView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/21.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "RedrawZoomScrollView.h"

@interface RedrawZoomScrollView() <UIScrollViewDelegate>

@end

@implementation RedrawZoomScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)commonInit {
    [super commonInit];
    self.delegate = self;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    // Take into account screen scale factor ie Retina display
    scale *= [[[scrollView window] screen] scale];
    
    // How it works? : Multiplier apply to the bounds of your view, used to determine the backing store should be. 100 x 100 view with scale of 2 -> 200 x 200 pixels
    [view setContentScaleFactor:scale];
}

@end
