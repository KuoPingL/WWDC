//
//  TopicViewController.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/15.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "TopicViewController.h"
#import "InfiniteScrollView/InfiniteScrollViewController.h"
#import "StationaryHeader/StationaryHeaderViewController.h"
#import "SimpleParallax/SimpleParallaxViewController.h"
#import "CustomizedTouchHandling/CustomizedTouchHandlingViewController.h"
#import "RedrawScale/RedrawZoomViewController.h"

@interface TopicViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIView *container;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) NSArray<NSString *> *topics;
@property (weak, nonatomic) UIViewController *currentChildController;
@property (strong, nonatomic) NSIndexPath *currentIndexPath;
@property (strong, nonatomic) NSLayoutConstraint *containerHeightConstraint;
@end

@implementation TopicViewController

static NSString * cellId = @"cellId";

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    _topics = @[@"Infinite ScrollView",
                @"Simple Parallax",
                @"Long Press to move the Moon",
                @"Stationary Header",
//                @"Redraw after zooming"
                ];
    
    _tableView = [UITableView new];
    _tableView.translatesAutoresizingMaskIntoConstraints = false;
    
    _container = [UIView new];
    _container.translatesAutoresizingMaskIntoConstraints = false;
    
    _label = [UILabel new];
    _label.translatesAutoresizingMaskIntoConstraints = false;
    _label.text = @"Please choose a topic";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_container];
    [self.view addSubview:_tableView];
    [self.view addSubview:_label];
    
    
    if (@available(iOS 11.0, *)) {
        [self.view addConstraints:@[
                                    [NSLayoutConstraint constraintWithItem:_container attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                    [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                    ]];
    } else {
        // Fallback on earlier versions
        [self.view addConstraints:@[
                                    [NSLayoutConstraint constraintWithItem:_container attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                    [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                    ]];
    }
    
    _containerHeightConstraint = [NSLayoutConstraint constraintWithItem:_container attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0];
    
    [self.view addConstraints:@[
                                
                                [NSLayoutConstraint constraintWithItem:_container attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_container attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0],
                                _containerHeightConstraint,
                                [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20],
                                [NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]
                                ]];
    
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:_label attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0],
                                [NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]
                                ]];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.textLabel.text = _topics[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_currentIndexPath == indexPath) {
        [tableView deselectRowAtIndexPath:indexPath animated:true];
        _currentIndexPath = nil;
        [self attachController:nil];
    } else {
        _currentIndexPath = indexPath;
        switch (indexPath.row) {
            case 0:
            {
                InfiniteScrollViewController *vc = [InfiniteScrollViewController new];
                [self attachController:vc];
            }
                break;
            case 1:
            {
                SimpleParallaxViewController *vc = [SimpleParallaxViewController new];
                [self attachController:vc];
            }
                break;
            case 2:
            {
                CustomizedTouchHandlingViewController *vc = [CustomizedTouchHandlingViewController new];
                [self attachController:vc];
            }
                break;
            case 3:
            {
                StationaryHeaderViewController *vc = [StationaryHeaderViewController new];
                [self attachController:vc];
            }
                break;
            case 4:
            {
//                RedrawZoomViewController *vc = [RedrawZoomViewController new];
//                [self attachController:vc];
            }
                break;
            default:
                [self attachController:nil];
                break;
        }
    }
}

- (void)attachController:(nullable UIViewController *) newController {
    if (_currentChildController != nil) {
        [_currentChildController willMoveToParentViewController:nil];
        [_currentChildController.view removeFromSuperview];
        [_currentChildController didMoveToParentViewController:nil];
        _currentChildController = nil;
    }
    
    if (newController != nil) {
        [newController willMoveToParentViewController:self];
        [newController.view setFrame:_container.bounds];
        [_container addSubview:newController.view];
        [self addChildViewController:newController];
        [newController didMoveToParentViewController:self];
        _currentChildController = newController;
        _label.hidden = true;
    } else {
        _label.hidden = false;
    }
}

@end
