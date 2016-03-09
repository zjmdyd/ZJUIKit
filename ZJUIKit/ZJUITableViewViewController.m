//
//  ZJUITableViewViewController.m
//  ZJUIKit
//
//  Created by ZJ on 3/9/16.
//  Copyright © 2016 YunTu. All rights reserved.
//

#import "ZJUITableViewViewController.h"

@interface ZJUITableViewViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *CellID = @"cell";

@implementation ZJUITableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor redColor];

    if (self.tableView.style == UITableViewStylePlain) {
        self.tableView.tableFooterView = [UIView new];
    }
    [self.view addSubview:self.tableView];
    // 加上提示性文字tableView(row == 0)时也可以滚动
    [self showMentionViewWithImgName:@"1348715545189" text:@"您还没有发布任何动态哦" superView:self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;   // 当row==0时且tableView上面没有内容时tableView不能滚动
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.textLabel.text = @"哈哈";
    
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
