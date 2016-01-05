//
//  ZJSegmentedControl.m
//  ZJUIKit
//
//  Created by zjw on 12/29/15.
//  Copyright © 2015 YunTu. All rights reserved.
//

#import "ZJSegmentedControl.h"

@interface ZJSegmentedControl () {
    NSArray *_titles;
    CGFloat _labelWidth;
    UIView *_highlightedView;
    UIView *_topView;
}

@end

@implementation ZJSegmentedControl

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    
    if (self) {
        _titles = titles;
    }
    
    return self;
}

- (void)layoutSubviews {
    [self initData];
    [self createBottomLabels];
    [self createTopLabels];
    [self createTopButtons];
}

/**
 *  默认值
 */
- (void)initData {
    
    if (_duration < CGFLOAT_MIN) {
        _duration = 0.25;
    }
    
    if (!_backgroundTextColor) {
        _backgroundTextColor = [UIColor blackColor];
    }
    
    if (!_highlightedTextColor) {
        _highlightedTextColor = [UIColor whiteColor];
    }
    
    if (!_highlightedBackgroundColor) {
        _highlightedBackgroundColor = [UIColor redColor];
    }
    
    if (_titles.count == 0) {
        _titles = @[@"I", @"Love", @"You"];
    }
    
    _labelWidth = self.width / _titles.count;
}

- (void)createBottomLabels {
    [self createLabelWithTextColor:_backgroundTextColor superView:self];
}

- (void)createTopLabels {
    _highlightedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _labelWidth, self.height)];
    _highlightedView.clipsToBounds = YES;
    _highlightedView.backgroundColor = _highlightedBackgroundColor;
    [self addSubview:_highlightedView];
    
    _topView = [[UIView alloc] initWithFrame:self.bounds];
    [_highlightedView addSubview:_topView];
    
    [self createLabelWithTextColor:_highlightedTextColor superView:_topView];
}

/**
 *  创建按钮
 */
- (void)createTopButtons {
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *tempButton = [[UIButton alloc] initWithFrame:CGRectMake(_labelWidth * i, 0, _labelWidth, self.height)];
        tempButton.tag = i;
        [tempButton addTarget:self action:@selector(tapButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempButton];
    }
}

- (void)tapButton:(UIButton *)sender {
    [UIView animateWithDuration:_duration animations:^{
        _highlightedView.frame = CGRectMake(_labelWidth * sender.tag, 0, _labelWidth, self.height);
        _topView.frame = CGRectMake(-_labelWidth * sender.tag, 0, _labelWidth, self.height);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)createLabelWithTextColor:(UIColor *)textColor superView:(UIView *)superView {
    for (int i = 0; i < _titles.count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*_labelWidth, 0, _labelWidth, self.height)];
        label.text = _titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = textColor;
        [superView addSubview:label];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
