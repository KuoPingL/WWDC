//
//  StationaryHeaderViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "StationaryHeaderViewController.h"
#import "../../Views/StationaryHeader/StationaryHeaderScrollView.h"

@interface StationaryHeaderViewController ()
@property (strong, nonatomic) StationaryHeaderScrollView *scrollView;
@end

@implementation StationaryHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [StationaryHeaderScrollView new];
    _scrollView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:_scrollView];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                ]];
}

@end
