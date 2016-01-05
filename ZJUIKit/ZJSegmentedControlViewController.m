//
//  ZJSegmentedControlViewController.m
//  ZJUIKit
//
//  Created by zjw on 12/28/15.
//  Copyright © 2015 YunTu. All rights reserved.
//

#import "ZJSegmentedControlViewController.h"
#import "ZJSegmentedControl.h"

@interface ZJSegmentedControlViewController ()

@end

@implementation ZJSegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZJSegmentedControl *control = [[ZJSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 44)
                                                                     titles:@[@"Hello", @"Apple", @"Swift", @"Objc"]];
    [self.view addSubview:control];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
