//
//  SimpleParallaxViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "SimpleParallaxViewController.h"
#import "../../Views/SimpleParallax/SimpleParallaxView.h"

@interface SimpleParallaxViewController ()
@property (strong, nonatomic) SimpleParallaxView *scrollView;
@end

@implementation SimpleParallaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    _scrollView = [SimpleParallaxView new];
    
    __weak SimpleParallaxViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view addSubview:weakSelf.scrollView];
        weakSelf.scrollView.frame = self.view.bounds;
        [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height)];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
