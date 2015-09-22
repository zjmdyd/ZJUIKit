//
//  ZJUIPickerviewViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/9/6.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIPickerviewViewController.h"

@interface ZJUIPickerviewViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation ZJUIPickerviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 400)];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 150, self.view.width, 300)];
    picker.layer.borderWidth = 1.0;
    picker.dataSource = self;
    picker.delegate = self;
    CALayer *layer = picker.layer;
    layer.frame = CGRectMake(0, 150, self.view.width, 300);
//    picker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight; // 没用
    [self.view addSubview:picker];
    
    NSLog(@"picker.frame = %@", NSStringFromCGRect(picker.frame));
    // picker.frame = {{0, 150}, {320, 300}}
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"第%d行", row];
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
