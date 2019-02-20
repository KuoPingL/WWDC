//
//  RedrawZoomViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/21.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "RedrawZoomViewController.h"
#import "../../Views/RedrawScale/RedrawZoomScrollView.h"

@interface RedrawZoomViewController ()
@property (strong, nonatomic) RedrawZoomScrollView *scrollView;
@end

@implementation RedrawZoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [RedrawZoomScrollView new];
    _scrollView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:_scrollView];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                ]];
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
