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
#import "ZJUIFontViewController.h"
#import "ZJUIPickerviewViewController.h"
#import "ZJUIDatePickerviewViewController.h"
#import "ZJUISearchBarWithResultsController.h"
#import "ZJUISearchBarWithResultsController.h"
#import "ZJNavigationViewController.h"

#import "ZJGesturesViewController.h"

#import "ZJUIGravityBehaviorViewController.h"
#import "ZJUIAttachmentBehaviorViewController.h"

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
    
    NSArray *s1 = @[@"UIView", @"UILabel", @"UIButton", @"UIImageView", @"UIScrollView", @"UIFont", @"UIPickerView", @"UIDatePicker", @"UISearchBar", @"Navigation"];
    NSArray *s2 = @[@"UIPanGesture"];
    NSArray *s3 = @[@"UIGravityBehavior", @"UIAttachmentBehavior"];
    NSArray *s4 = @[@"AutoLayout"];
    NSArray *s5 = @[@"CircleScrollView", @"UnfoldTableView", @"Palette(调色板)"];
    _titles = @[s1, s2, s3, s4, s5];
    
    NSArray *s0VC = @[
                      [self.storyboard instantiateViewControllerWithIdentifier:@"UIView"],
                      [ZJUILabelViewController new],
                      [ZJUIButtonViewController new],
                      [self.storyboard instantiateViewControllerWithIdentifier:@"UIImageView"],
                      [ZJUIScrollViewViewController new],
                      [ZJUIFontViewController new],
                      [ZJUIPickerviewViewController new],
                      [ZJUIDatePickerviewViewController new],
                      [ZJUISearchBarWithResultsController new],
                      [ZJNavigationViewController new]
                      ];
    
    NSArray *s1VC = @[
                      [ZJGesturesViewController new]
                      ];
    
    NSArray *s2VC = @[
                      [ZJUIGravityBehaviorViewController new],
                      [ZJUIAttachmentBehaviorViewController new]
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
    
//    NSInteger row = indexPath.row;
    
    
    UIViewController *vc = _vcs[indexPath.section][indexPath.row];
//    if (indexPath.section == 0) {
//        if (row == 0) {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UIView"];
//        }else if (row == 1) {
//            vc = [[ZJUILabelViewController alloc] init];
//        }else if (row == 2) {
//            vc = [[ZJUIButtonViewController alloc] init];
//        }else if (row == 3) {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UIImageView"];
//        }else if (row == 4) {
//            vc = [[ZJUIScrollViewViewController alloc] init];
//        }else if (row == 5) {
//            vc = [[ZJUIFontViewController alloc] init];
//        }else if (row == 6) {
//            vc = [[ZJUIPickerviewViewController alloc] init];
//        }else if (row == 7) {
//            vc = [[ZJUIDatePickerviewViewController alloc] init];
//        }else if (row == 8) {
//            vc = [[ZJUISearchBarWithResultsController alloc] init];
//        }else if (row == 9) {
//            vc = [ZJUISearchBarWithResultsController new];
//        }
//    }else if (indexPath.section == 1) {
//        if (row == 0) {
//            vc = [[ZJGesturesViewController alloc] init];
//        }
//    }else if (indexPath.section == 2) {
//        if (row == 0) {
//            vc = [[ZJUIGravityBehaviorViewController alloc] init];
//        }else if (row == 1) {
//            vc = [[ZJUIAttachmentBehaviorViewController alloc] init];
//        }
//    }else if (indexPath.section == 3) {
//        if (row == 0) {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AutoLayout"];
//        }
//    }else if (indexPath.section == 4) {
//        if (row == 0) {
//            vc = [[ZJCircleScrollViewController alloc] init];
//        }else if(row == 1) {
//            vc = [[ZJUnfoldTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
//        }else if(row == 2) {
//            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Palette"];
//        }
//    }
    
    if (vc) {
        vc.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
