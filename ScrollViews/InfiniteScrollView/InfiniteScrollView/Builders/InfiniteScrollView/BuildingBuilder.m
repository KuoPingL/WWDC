//
//  BuildingBuilder.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/16.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "BuildingBuilder.h"
#import "UIColor+JColor.h"

@protocol BuildingBuilderDelegate <NSObject>

@end

@interface BuildingBuilder()
@end

@implementation BuildingBuilder

+ (BuildingView *) generateRandomBuildingWithMaximumSize: (CGSize) maxSize {
    CGSize size = [BuildingBuilder generateNewSizeFromMaximumSize:maxSize];
    BuildingView *building = [[BuildingView alloc] initWithFrame:
                        CGRectMake(0, 0, size.width, size.height)];
    return building;
}

+ (CGSize) generateNewSizeFromMaximumSize: (CGSize) maxSize {
    CGFloat height = (CGFloat)arc4random_uniform((uint32_t)(maxSize.height));
    CGFloat width = (CGFloat)arc4random_uniform((uint32_t)(maxSize.width));
    CGSize size = CGSizeMake(width, height);
    return size;
}

@end
