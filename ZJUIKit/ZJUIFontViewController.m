//
//  ZJUIFontViewController.m
//  ZJFont
//
//  Created by YunTu on 15/3/13.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJUIFontViewController.h"

@interface ZJUIFontViewController () {
    UILabel *_kicksLabel;
    NSArray *_fonts;
    UILabel *_nameLabel;
}

@end

@implementation ZJUIFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _fonts = [UIFont familyNames];
    NSLog(@"count = %d", _fonts.count);
    _kicksLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 100)];
    _kicksLabel.center = CGPointMake(self.view.width*0.5, _kicksLabel.center.y);
    _kicksLabel.text = @"赠送您10积分\n每天一次";
    _kicksLabel.textColor = [UIColor blackColor];
    _kicksLabel.font = [UIFont systemFontOfSize:22];
    _kicksLabel.textAlignment = NSTextAlignmentCenter;
    _kicksLabel.numberOfLines = 0;
    _kicksLabel.layer.borderWidth = 1.0;
    [self.view addSubview:_kicksLabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(changeFont:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"切换字体" forState:UIControlStateNormal];
    btn.center = CGPointMake(self.view.center.x, _kicksLabel.bottom + 50);
    [self.view addSubview:btn];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 120)];
    _nameLabel.center = CGPointMake(self.view.width*0.5, btn.bottom + 100);
    _nameLabel.text = @"System font";
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:22];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.numberOfLines = 0;
    _nameLabel.layer.borderWidth = 1.0;
    [self.view addSubview:_nameLabel];
}

- (void)changeFont:(UIButton *)sender {
    if (sender.tag == _fonts.count) {
        sender.tag = 0;
    }
    _kicksLabel.font = [UIFont fontWithName:_fonts[sender.tag] size:22];
    _nameLabel.text = [NSString stringWithFormat:@"fontName:%@\nindex = %d", _fonts[sender.tag], sender.tag];
    NSLog(@"name = %@, tag = %d", _fonts[sender.tag], sender.tag);
    sender.tag  += 1;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
