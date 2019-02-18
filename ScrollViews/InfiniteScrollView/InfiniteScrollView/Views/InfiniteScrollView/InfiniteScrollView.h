//
//  InfiniteScrollView.h
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/17.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuildingBuilder.h"

NS_ASSUME_NONNULL_BEGIN

@interface InfiniteScrollView : UIScrollView
- (void)recenterIfNeeded;
@end

NS_ASSUME_NONNULL_END
