//
//  StationaryHeaderScrollView.h
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StationaryHeaderScrollView : UIScrollView
- (void)commonInit;
- (void)setImage: (UIImage *)image withTitle: (NSString *)title;
@end

NS_ASSUME_NONNULL_END
