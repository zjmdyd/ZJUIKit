//
//  ZJUIButtonViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/8/13.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIButtonViewController.h"

@interface ZJUIButtonViewController ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation ZJUIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIButton";
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [self.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.button.center = self.view.center;
    self.button.backgroundColor = [UIColor redColor];
    self.button.titleLabel.numberOfLines = 0;
    [self.view addSubview:self.button];
    [self.button setTitle:@"1\n2" forState:UIControlStateNormal];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.button.width - 20, self.button.height - 20)];
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
//    [self.button addSubview:label];
    
    // 圆角没效果
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"sender" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.layer.borderWidth = 1.0;
    btn.layer.cornerRadius = 8;
    btn.layer.masksToBounds = YES;
}

/*
    测试button子视图遮挡能否屏蔽Btn的Action
    结果:不能屏蔽button的touch事件
 */
- (void)buttonAction:(UIButton *)sender {
    NSLog(@"%s", __func__);
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
