//
//  BuildingBuilder.h
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/16.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BuildingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BuildingBuilder : NSObject
+ (BuildingView *) generateRandomBuildingWithMaximumSize: (CGSize) maxSize;
@end

NS_ASSUME_NONNULL_END
