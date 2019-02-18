//
//  InfiniteScrollViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/16.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "InfiniteScrollViewController.h"
#import "InfiniteScrollView.h"

@interface InfiniteScrollViewController ()
@property (strong, nonatomic) InfiniteScrollView *scrollView;
@end

@implementation InfiniteScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    _scrollView = [InfiniteScrollView new];
    
    __weak InfiniteScrollViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view addSubview:weakSelf.scrollView];
        weakSelf.scrollView.frame = self.view.bounds;
        [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height)];
    });
}

@end
