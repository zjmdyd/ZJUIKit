//
//  ZJUITintColorViewController.m
//  ZJUIKit
//
//  Created by ZJ on 1/6/16.
//  Copyright © 2016 YunTu. All rights reserved.
//

#import "ZJUITintColorViewController.h"

@interface ZJUITintColorViewController () {
    float _red, _green, _blue;
}

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ZJUITintColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)sliderAction:(UISlider *)sender {
    if (sender.tag == 0) {
        _red = sender.value;
    }else if (sender.tag == 1) {
        _green = sender.value;
    }else {
        _blue = sender.value;
    }
    self.button.tintColor = [UIColor colorWithRed:_red green:_green blue:_blue alpha:1];
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
