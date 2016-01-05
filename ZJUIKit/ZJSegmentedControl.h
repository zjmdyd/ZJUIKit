//
//  ZJSegmentedControl.h
//  ZJUIKit
//
//  Created by zjw on 12/29/15.
//  Copyright © 2015 YunTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJSegmentedControl : UIView

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, strong) UIColor *backgroundTextColor;         // 背景文字颜色
@property (nonatomic, strong) UIColor *highlightedTextColor;        // 高亮文字颜色
@property (nonatomic, strong) UIColor *highlightedBackgroundColor;  // 高亮背景色

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end
