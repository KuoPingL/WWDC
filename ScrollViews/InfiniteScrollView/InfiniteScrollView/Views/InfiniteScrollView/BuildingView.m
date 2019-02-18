//
//  BuildingView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/18.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "BuildingView.h"
#import "UIColor+JColor.h"

@implementation BuildingView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor]; //[UIColor randomColor];
    }
    return self;
}

@end
