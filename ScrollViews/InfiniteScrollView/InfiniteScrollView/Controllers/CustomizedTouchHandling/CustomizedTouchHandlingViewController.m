//
//  CustomizedTouchHandlingViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "CustomizedTouchHandlingViewController.h"
#import "../../Views/CustomizedTouchHandling/CustomizedTouchHandlingView.h"

@interface CustomizedTouchHandlingViewController ()
@property (strong, nonatomic) CustomizedTouchHandlingView *scrollView;
@end

@implementation CustomizedTouchHandlingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    _scrollView = [CustomizedTouchHandlingView new];
    
    __weak CustomizedTouchHandlingViewController *weakSelf = self;
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
