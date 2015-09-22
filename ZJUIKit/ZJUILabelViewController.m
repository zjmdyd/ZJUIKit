//
//  ZJUILabelViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/6/18.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUILabelViewController.h"

@interface ZJUILabelViewController ()

@property (strong, nonatomic) UILabel *editlabel;

@end

@implementation ZJUILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UILabel";

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.center = self.view.center;
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(label.left, label.bottom + 10, label.width, label.height)];
    [btn setTitle:@"edit" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editEnable:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    NSLog(@"%s", __func__);
}

/**
 *  测试Label不可被编辑
 */
- (void)editEnable:(UIButton *)sender {
    self.editlabel.userInteractionEnabled = YES;
    [self.editlabel becomeFirstResponder];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
    代码视图加载顺序 (xib和代码创建的顺序是一样的)
 
 2015-07-08 16:39:38.585 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidLoad]
 2015-07-08 16:39:38.588 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewWillAppear:]
 2015-07-08 16:39:39.118 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidAppear:]
 2015-07-08 16:41:18.570 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewWillDisappear:]
 2015-07-08 16:41:19.086 ZJUIKit[787:80947] -[ZJTestOrderOfLoadViewController viewDidDisappear:]
 *
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
