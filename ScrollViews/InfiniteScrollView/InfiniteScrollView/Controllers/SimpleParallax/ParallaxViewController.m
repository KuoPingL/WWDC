//
//  ParallaxViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/18.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "ParallaxViewController.h"
#import "SimpleParallaxView.h"

@interface ParallaxViewController ()
@property (strong, nonatomic) SimpleParallaxView *scrollView;
@end

@implementation ParallaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    _scrollView = [SimpleParallaxView new];
    
    __weak ParallaxViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view addSubview:weakSelf.scrollView];
        weakSelf.scrollView.frame = self.view.bounds;
        [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height)];
    });
}

@end
