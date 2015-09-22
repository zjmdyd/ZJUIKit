//
//  ZJUIScrollViewViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/9/12.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIScrollViewViewController.h"

@interface ZJUIScrollViewViewController ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
}

@end

@implementation ZJUIScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSetting];
    [self loadSubviews];
}

- (void)initSetting {
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/*
    子视图bounds大于父视图的bounds
 */
- (void)loadSubviews {
    CGFloat top = 74;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, top, self.view.width - 20*2, self.view.height - top - 50)];
    _scrollView.delegate = self;
    _scrollView.layer.borderWidth = 1.0;
    [self.view addSubview:_scrollView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, -_scrollView.height, _scrollView.width, _scrollView.height*2)];
    view.backgroundColor = [UIColor orangeColor];
    [_scrollView addSubview:view];
    
    _scrollView.contentSize = CGSizeMake(0, view.height - _scrollView.height);
    _scrollView.contentInset = UIEdgeInsetsMake(_scrollView.height, 0, 0, 0);
//    _scrollView.contentOffset = CGPointMake(0, -_scrollView.height);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"began = %@", NSStringFromCGPoint(_scrollView.contentOffset));
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
