//
//  ZJUIDatePickerviewViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/9/6.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIDatePickerviewViewController.h"

@interface ZJUIDatePickerviewViewController ()

@end

@implementation ZJUIDatePickerviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 400)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 150, self.view.width, 300)];
//    datePicker.frame = CGRectMake(0, 150, self.view.width, 300);  //分开写没效果(网友乱喷)
    datePicker.layer.borderWidth = 1.0;
//    CALayer *layer = datePicker.layer;
//    layer.frame = CGRectMake(0, 150, self.view.width, 300);       // 可以改变大小
    [self.view addSubview:datePicker];
    
    NSLog(@"datePicker.frame = %@", NSStringFromCGRect(datePicker.frame));
    // datePicker.frame = {{0, 150}, {320, 300}}    // frame是变大了,但是效果没有,白边多了 默认高度 : 216
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
