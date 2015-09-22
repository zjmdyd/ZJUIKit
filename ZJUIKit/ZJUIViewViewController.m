//
//  ZJUIViewViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/8/3.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIViewViewController.h"

@interface ZJUIViewViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollSubview;

@end

@implementation ZJUIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.redView.clipsToBounds = YES;
    
    self.scrollView.layer.borderWidth = 1.0;
    self.scrollView.contentSize = CGSizeMake(self.scrollSubview.left + self.scrollSubview.width ,
                                             self.scrollSubview.top + self.scrollSubview.height);
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
