//
//  ZJGesturesViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/8/3.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJGesturesViewController.h"
#import "UIViewExt.h"

@interface ZJGesturesViewController ()

@property (strong, nonatomic) UIImageView *bgIV;

@end

@implementation ZJGesturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
    self.bgIV.image = [UIImage imageNamed:@"1348715545189.jpg"];
    self.bgIV.userInteractionEnabled = YES;
    self.bgIV.contentMode = UIViewContentModeScaleAspectFill;
    self.bgIV.clipsToBounds = YES;  // 看pop的效果
    [self.view addSubview:self.bgIV];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 120, 40)];
    btn.backgroundColor = [UIColor redColor];
    [self.bgIV addSubview:btn];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [btn addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    UIView *view = sender.view;
    view.center = [sender locationInView:self.bgIV];
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
