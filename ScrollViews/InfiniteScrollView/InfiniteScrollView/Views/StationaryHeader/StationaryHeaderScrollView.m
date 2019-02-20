//
//  StationaryHeaderScrollView.m
//  InfiniteScrollView
//
//  Created by Jimmy on 2019/2/20.
//  Copyright © 2019 Jimmy. All rights reserved.
//

#import "StationaryHeaderScrollView.h"
#import "../../ConstantHeader.h"

@interface StationaryHeaderScrollView() <UIScrollViewDelegate>
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UIImageView *imageView;
@end

@implementation StationaryHeaderScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    self.delegate = self;
    
    self.minimumZoomScale = 1.0;
    self.maximumZoomScale = 6.0;
    
    _headerView = [UIView new];
    _headerView.translatesAutoresizingMaskIntoConstraints = false;
    
    _headerLabel = [UILabel new];
    _headerLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [_headerView addSubview:_headerLabel];
    [_headerView addConstraints:@[
                                  [NSLayoutConstraint constraintWithItem:_headerLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
                                  [NSLayoutConstraint constraintWithItem:_headerLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0],
                                  [NSLayoutConstraint constraintWithItem:_headerLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                                  [NSLayoutConstraint constraintWithItem:_headerLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]
                                  ]];
    _headerLabel.text = @"My TITLE";
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SAMPLE_IMG_01]];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self addSubview:_headerView];
    [self addSubview:_imageView];
    
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:_headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0],
                           [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_headerView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:_imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]
                           ]];
    
    __weak StationaryHeaderScrollView *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        CGFloat imgV_Width = weakSelf.imageView.frame.size.width;
        UIImage *img = [UIImage imageNamed:SAMPLE_IMG_01];
        CGFloat imgWidth = img.size.width;
        CGFloat imgHeight = img.size.height;
        CGFloat ratio = imgHeight / imgWidth;
        CGFloat imgV_Height = ratio * imgV_Width;
        [weakSelf addConstraint:[NSLayoutConstraint constraintWithItem:weakSelf.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:imgV_Height]];
    });
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self adjustTitleIfNeeded];
    self.contentSize = CGSizeMake(_imageView.frame.size.width, _imageView.frame.size.height + _headerView.frame.size.height);
}

- (void)adjustTitleIfNeeded {
    [_headerView setFrame:CGRectMake(self.contentOffset.x, _headerView.frame.origin.y, _headerView.frame.size.width, _headerView.frame.size.height)];
}

- (void)setImage: (UIImage *)image withTitle: (NSString *)title {
    _imageView.image = image;
    _headerLabel.text = title;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

@end
