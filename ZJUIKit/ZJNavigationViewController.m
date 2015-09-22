//
//  ZJNavigationViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/9/15.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJNavigationViewController.h"

@interface ZJNavigationViewController ()

@end

@implementation ZJNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationItem setPrompt:@"hahahahahahahahah"];
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)); // 1  NSEC_PER_SEC表示的是秒数，它还提供了NSEC_PER_MSEC表示毫秒
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){ // 2
        [self.navigationItem setPrompt:nil];
    });
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
