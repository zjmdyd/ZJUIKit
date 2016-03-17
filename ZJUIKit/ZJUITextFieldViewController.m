//
//  ZJUITextFieldViewController.m
//  ZJUIKit
//
//  Created by ZJ on 3/17/16.
//  Copyright © 2016 YunTu. All rights reserved.
//

#import "ZJUITextFieldViewController.h"

@interface ZJUITextFieldViewController ()<UITextFieldDelegate> {
    NSString *_text;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;

@end

@implementation ZJUITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

/// 自定义键盘可实现文本框的支付密码输入方式, 思想是寻找一个媒介传播text, 下面的原理类似

- (IBAction)buttonAction:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:self.textField.text];
    [str appendString:@"1"];
    self.textField.text = str;
//    [self.textField2 becomeFirstResponder];
}

#pragma mark -

- (void)textFieldDidChange:(NSNotification *)noti {
    UITextField *tf = noti.object;
    self.textField.text = tf.text;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.textField resignFirstResponder];
    [self.textField2 resignFirstResponder];
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
