//
//  ZJUISearchBarWithResultsController.m
//  ZJUIKit
//
//  Created by YunTu on 15/7/9.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUISearchBarWithResultsController.h"
#import "ZJSearchResultTableViewController.h"
#import "UIViewExt.h"

@interface ZJUISearchBarWithResultsController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchController;

@end

static NSString *CELLID = @"cell";

@implementation ZJUISearchBarWithResultsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 44)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    ZJSearchResultTableViewController *vc = [[ZJSearchResultTableViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:vc];
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.searchResultsUpdater = vc;    // 设置delegate
    self.searchController.delegate = vc;
    self.definesPresentationContext = YES;
    self.searchController.searchBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    [self setSearchBarBackBroundColor: [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:0.65f] searchBar:self.searchController.searchBar]; 
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
    searchBar.showsCancelButton = YES;
    [self setSearchBarBackBroundColor:[UIColor lightGrayColor] searchBar:searchBar];
    for (UIView *v in [searchBar.subviews[0] subviews]) {
        if ([NSStringFromClass(v.class) isEqualToString:@"UINavigationButton"]) {
            [(UIButton *)v setTitle:@"取消" forState:UIControlStateNormal];
            break;
        }
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
    
    [self setSearchBarBackBroundColor:[UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:0.65f] searchBar:searchBar];
    searchBar.showsCancelButton = NO;
}

- (void)setSearchBarBackBroundColor:(UIColor *)color searchBar:(UISearchBar *)searchBar {
    for (UIView *v in [searchBar.subviews[0] subviews]) {
        if ([NSStringFromClass(v.class) isEqualToString:@"UISearchBarBackground"]) {
            UIView *myView = [[UIView alloc] initWithFrame:v.frame];
            myView.backgroundColor = color;
            [v.superview insertSubview:myView atIndex:0];
            [v removeFromSuperview];
            break;
        }else if ([NSStringFromClass(v.class) isEqualToString:@"UIView"]) {
            v.backgroundColor = color;
            break;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLID];
    }
    
    return cell;
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
