//
//  ViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/6/18.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ViewController.h"

#import "ZJUILabelViewController.h"
#import "ZJUIButtonViewController.h"
#import "ZJUIScrollViewViewController.h"
#import "ZJUITableViewViewController.h"
#import "ZJUIFontViewController.h"
#import "ZJUIPickerviewViewController.h"
#import "ZJUIDatePickerviewViewController.h"
#import "ZJUISearchBarWithResultsController.h"
#import "ZJUISearchBarWithResultsController.h"
#import "ZJNavigationViewController.h"

#import "ZJGesturesViewController.h"

#import "ZJUIGravityBehaviorViewController.h"
#import "ZJUIAttachmentBehaviorViewController.h"
#import "ZJUIViewAnimationViewController.h"

#import "ZJCircleScrollViewController.h"
#import "ZJUnfoldTableViewController.h"
#import "ZJPaletteViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_sectionTitles, *_titles, *_vcs;
}

@end

static NSString *CELLID = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAry];
    NSLog(@"%s", __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

/**
  storyBoard 视图加载顺序 (xib和代码创建的顺序是一样的)
 
 2015-07-08 16:39:38.585 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidLoad]
 2015-07-08 16:39:38.588 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewWillAppear:]
 2015-07-08 16:39:39.118 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidAppear:]
 2015-07-08 16:41:18.570 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewWillDisappear:]
 2015-07-08 16:41:19.086 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidDisappear:]
 *
 */

- (void)initAry {
    _sectionTitles = [NSArray arrayWithObjects:@"视图篇", @"手势篇", @"动画篇(UIDynamicAnimator)", @"自动布局篇", @"Demo篇", nil];
    
    NSArray *s1 = @[@"UIView", @"UILabel", @"UIButton", @"UIImageView", @"UIScrollView", @"UITableView", @"UIFont", @"UIPickerView", @"UIDatePicker", @"UISearchBar", @"Navigation", @"UITintColor"];
    NSArray *s2 = @[@"UIPanGesture"];
    NSArray *s3 = @[@"UIGravityBehavior", @"UIAttachmentBehavior", @"ZJUIViewAnimation"];
    NSArray *s4 = @[@"AutoLayout"];
    NSArray *s5 = @[@"CircleScrollView", @"UnfoldTableView", @"Palette(调色板)"];
    _titles = @[s1, s2, s3, s4, s5];
    
    NSArray *s0VC = @[
                      [self.storyboard instantiateViewControllerWithIdentifier:@"UIView"],
                      [ZJUILabelViewController new],
                      [ZJUIButtonViewController new],
                      [self.storyboard instantiateViewControllerWithIdentifier:@"UIImageView"],
                      [ZJUIScrollViewViewController new],
                      [ZJUITableViewViewController new],
                      [ZJUIFontViewController new],
                      [ZJUIPickerviewViewController new],
                      [ZJUIDatePickerviewViewController new],
                      [ZJUISearchBarWithResultsController new],
                      [ZJNavigationViewController new],
                      [self.storyboard instantiateViewControllerWithIdentifier:@"tintColor"]
                      ];
    
    NSArray *s1VC = @[
                      [ZJGesturesViewController new]
                      ];
    
    NSArray *s2VC = @[
                      [ZJUIGravityBehaviorViewController new],
                      [ZJUIAttachmentBehaviorViewController new],
                      [self.storyboard instantiateViewControllerWithIdentifier:@"UIViewAnimation"]
                      ];
    
    NSArray *s3VC = @[
                      [self.storyboard instantiateViewControllerWithIdentifier:@"AutoLayout"]
                      ];
    
    NSArray *s4VC = @[
                      [ZJCircleScrollViewController new],
                      [[ZJUnfoldTableViewController alloc] initWithStyle:UITableViewStyleGrouped],
                      [self.storyboard instantiateViewControllerWithIdentifier:@"Palette"]
                      ];
    _vcs = @[s0VC, s1VC, s2VC, s3VC, s4VC];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titles[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    
    cell.textLabel.text = _titles[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = _vcs[indexPath.section][indexPath.row];
    
    if (vc) {
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
