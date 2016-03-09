//
//  ZJUIFontViewController.m
//  ZJFont
//
//  Created by YunTu on 15/3/13.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIFontViewController.h"
#import "ZJPickerView.h"

@interface ZJUIFontViewController ()<ZJPickerViewDataSource, ZJPickerViewDelegate> {
    UILabel *_kicksLabel;
    NSArray *_fonts;
    UILabel *_nameLabel;
    ZJPickerView *_pickerView;
}

@end

@implementation ZJUIFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fonts = [UIFont familyNames];
    NSLog(@"count = %zd", _fonts.count);
    _kicksLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 74, 200, 100)];
    _kicksLabel.center = CGPointMake(self.view.width*0.5, _kicksLabel.center.y);
    _kicksLabel.text = @"赠送您10积分\n每天一次";
    _kicksLabel.textColor = [UIColor blackColor];
    _kicksLabel.font = [UIFont systemFontOfSize:22];
    _kicksLabel.textAlignment = NSTextAlignmentCenter;
    _kicksLabel.numberOfLines = 0;
    _kicksLabel.layer.borderWidth = 1.0;
    [self.view addSubview:_kicksLabel];
    
    _pickerView = [[ZJPickerView alloc] initWithSuperView:self.view dateSource:self delegate:self];
    [self.view addSubview:_pickerView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"切换字体" forState:UIControlStateNormal];
    btn.center = CGPointMake(self.view.center.x, _kicksLabel.bottom + 50);
    [self.view addSubview:btn];
    
//    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 120)];
//    _nameLabel.center = CGPointMake(self.view.width*0.5, btn.bottom + 100);
//    _nameLabel.text = @"System font";
//    _nameLabel.textColor = [UIColor blackColor];
//    _nameLabel.font = [UIFont systemFontOfSize:22];
//    _nameLabel.textAlignment = NSTextAlignmentCenter;
//    _nameLabel.numberOfLines = 0;
//    _nameLabel.layer.borderWidth = 1.0;
//    [self.view addSubview:_nameLabel];
}

- (void)changeFont:(UIButton *)sender {
    [self showPicker];
    if (sender.tag == _fonts.count) {
        sender.tag = 0;
    }
    _kicksLabel.font = [UIFont fontWithName:_fonts[sender.tag] size:22];
//    _nameLabel.text = [NSString stringWithFormat:@"fontName:%@\nindex = %d", _fonts[sender.tag], sender.tag];
    NSLog(@"name = %@, tag = %zd", _fonts[sender.tag], sender.tag);
    sender.tag  += 1;
}

- (void)showPicker {
    _pickerView.hidden = !_pickerView.isHidden;
}

#pragma mark - 

- (NSInteger)numberOfComponentsInPickerView:(ZJPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(ZJPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _fonts.count;
}

- (NSString *)pickerView:(ZJPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _fonts[row];
}

- (void)pickerView:(ZJPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _kicksLabel.font = [UIFont fontWithName:_fonts[row] size:22];
    _nameLabel.text = [NSString stringWithFormat:@"fontName:%@\nindex = %zd", _fonts[row], row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
