//
//  InfiniteScrollView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/17.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "InfiniteScrollView.h"

@interface InfiniteScrollView()
{
    NSMutableArray<BuildingView *>  *visibleBuildings;
    UIView          *buildingContainerView, *testView;
    CGFloat         baseLineMinY, baseLineMaxY;
}
- (void)tileBuildingsFromMinX: (CGFloat) minVisibleX toMaxX: (CGFloat) maxVisibleX;
@end

@implementation InfiniteScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        visibleBuildings = [NSMutableArray new];
    }
    return self;
}

- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    if (buildingContainerView != nil) {
        [buildingContainerView removeFromSuperview];
        buildingContainerView = nil;
    }
    buildingContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    buildingContainerView.backgroundColor = UIColor.clearColor;
    [self addSubview:buildingContainerView];
    baseLineMinY = buildingContainerView.bounds.size.height * 0.1;
    baseLineMaxY = buildingContainerView.bounds.size.height - baseLineMinY * 2;
}

- (CGFloat)getBaseLineMinY {
    return baseLineMinY;
}

- (void)setBaseLineMinY: (CGFloat) minY {
    baseLineMinY = minY;
}

- (CGFloat)getBaseLineMaxY {
    return baseLineMaxY;
}

- (void)setBaseLineMaxY: (CGFloat) maxY {
    baseLineMaxY = maxY;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self recenterIfNeeded];
    
    // tile content in visible bounds
//    CGRect visibleBounds = CGRectMake(0, baseLineMinY, self.bounds.size.width, self.bounds.size.height - baseLineMinY);
    // THIS IS IMPORTANT
    CGRect visibleBounds = self.bounds;
    CGFloat minimumVisibleX = CGRectGetMinX(visibleBounds);
    CGFloat maximumVisibleX = CGRectGetMaxX(visibleBounds);
    [self tileBuildingsFromMinX:minimumVisibleX toMaxX:maximumVisibleX];
}

- (void)recenterIfNeeded {
    CGPoint currentOffset = self.contentOffset;
    CGFloat contentWidth = self.contentSize.width;
    CGFloat centerOffsetX = (contentWidth - self.bounds.size.width) / 2.0;
    CGFloat distanceFromCenter = fabs(currentOffset.x - centerOffsetX);
#if DEBUG
    NSLog(@"\nContent Width : %f\nCenter OffsetX : %f\nCurrentOffsetX : %f\nDistance From Center : %f\n\n ", contentWidth, centerOffsetX, currentOffset.x, distanceFromCenter);
#endif
    if (distanceFromCenter > contentWidth / 3.0 ) {
        // move content back to center
        self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y);
        
        for (UIView *building in visibleBuildings) {
            CGPoint center = building.center;
            center.x += centerOffsetX - currentOffset.x;
            building.center = center;
        }
    }
}

- (void)tileBuildingsFromMinX: (CGFloat) minVisibleX toMaxX: (CGFloat) maxVisibleX {
    if (visibleBuildings.count == 0) {
        // generate new building on the right
        [self placeBuildingOnRight:minVisibleX];
    }
    
    UIView *lastBuilding = [visibleBuildings lastObject];
    CGFloat rightEdge = CGRectGetMaxX(lastBuilding.frame);
    
    while (rightEdge < maxVisibleX) {
        rightEdge = [self placeBuildingOnRight:rightEdge];
    }
    
    // Add buildings on the left
    UIView *firstBuilding = [visibleBuildings firstObject];
    CGFloat leftEdge = CGRectGetMinX(firstBuilding.frame);
    
    while (leftEdge > minVisibleX) {
        leftEdge = [self placeBuildingOnLeft:leftEdge];
    }
    
    // Remove Buildings that have fallen off right edge
    lastBuilding =[visibleBuildings lastObject];
    while (CGRectGetMinX(lastBuilding.frame) > maxVisibleX) {
        [lastBuilding removeFromSuperview];
        [visibleBuildings removeLastObject];
        lastBuilding = [visibleBuildings lastObject];
    }
    
    // Remove Buildings that have fallen off left Edge
    firstBuilding =[visibleBuildings firstObject];
    while (CGRectGetMaxX(firstBuilding.frame) < minVisibleX) {
        [firstBuilding removeFromSuperview];
        [visibleBuildings removeObjectAtIndex:0];
        firstBuilding = [visibleBuildings firstObject];
    }
}

- (CGFloat)placeBuildingOnRight:(CGFloat) rightEdge {
    BuildingView *building = [self insertBuilding];
    [visibleBuildings addObject:building];
    CGRect frame = building.frame;
    frame.origin.x = rightEdge;
    frame.origin.y = baseLineMaxY - frame.size.height;
    [building setFrame:frame];
    return CGRectGetMaxX(frame);
}

- (CGFloat)placeBuildingOnLeft:(CGFloat) leftEdge {
    BuildingView *building = [self insertBuilding];
    [visibleBuildings insertObject:building atIndex:0];
    CGRect frame = building.frame;
    frame.origin.x = leftEdge - frame.size.width;
    frame.origin.y = baseLineMaxY - frame.size.height;
    [building setFrame:frame];
    return CGRectGetMinX(frame);
}

- (BuildingView *)insertBuilding {
    CGFloat width = self.bounds.size.width * 0.3;
    CGFloat height = baseLineMaxY - baseLineMinY;
    CGSize maximumSize = CGSizeMake(width, height);
    BuildingView *building = [BuildingBuilder generateRandomBuildingWithMaximumSize:maximumSize];
    [buildingContainerView addSubview:building];
    return building;
}

@end
