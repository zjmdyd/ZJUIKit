//
//  ZJCategory.m
//  ButlerSugar
//
//  Created by ZJ on 3/4/16.
//  Copyright © 2016 csj. All rights reserved.
//

#import "ZJCategory.h"

@implementation ZJCategory

@end

@implementation UITableView (HYTableView)

- (void)registerCellWithIDs:(NSArray *)cellIDs nibCount:(NSInteger)nibCount {
    for (int i = 0; i < cellIDs.count; i++) {
        NSString *cellID = cellIDs[i];
        if (i < nibCount) {
            [self registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
        }else {
            [self registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        }
    }
}

- (UIView *)createHeaderLabelWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 21)];
    label.text = text;
    if (!color) {
        color = [UIColor lightGrayColor];
    }
    if (!font) {
        font = [UIFont systemFontOfSize:15];
    }

    label.font = font;
    label.textColor = color;
    
    return label;
}

@end

@implementation NSDictionary (HYDictionary)

- (BOOL)containsKey:(NSString *)key {
    for (NSString *str in self.allKeys) {
        if ([key isEqualToString:str]) {
            return YES;
        }
    }
    
    return NO;
}

@end

@implementation NSArray (HYNSArray)

- (NSString *)changeToStringWithSeparator:(NSString *)separator {
    NSMutableString *str = [NSMutableString string];

    for (int i = 0; i < self.count; i++) {
        [str appendString:self[i]];
        if (i != self.count-1) {
            [str appendString:[NSString stringWithFormat:@"%@", separator]];
        }
    }
    
    return str;
}

@end

@implementation NSMutableArray (HYMutableArray)

- (void)addObject:(id)obj toSubAry:(NSMutableArray *)subAry {
    if (subAry) {
        [subAry addObject:obj];
        if (![self containsObject:subAry]) {
            [self addObject:subAry];
        }
    }else {
        subAry = [NSMutableArray array];
        [subAry addObject:obj];
        [self addObject:subAry];
    }
}

@end
@implementation UIViewController (HYViewController)

#define HiddenViewTag 19999
#define Window self.view //[UIApplication sharedApplication].keyWindow

- (void)createMentionViewWithImgName:(NSString *)name text:(NSString *)text superView:(UIView *)superView{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.tag = HiddenViewTag;
    view.alpha = 0.0;
    view.hidden = YES;
    view.backgroundColor = [UIColor whiteColor];
    if (superView) {
        [superView addSubview:view];
    }else {
        [Window addSubview:view];
    }
    [self exchange:view];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    iv.image = [UIImage imageNamed:name];
    iv.center = CGPointMake(view.center.x, (view.height-64)/2 - 50);
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:iv];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, iv.bottom+10, view.size.width, 21)];
//    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    
    [view addSubview:label];
}

- (void)exchange:(UIView *)view {
    for (UIView *v in view.superview.subviews) {
//        if ([v isMemberOfClass:[MBProgressHUD class]]) {
//            [v.superview bringSubviewToFront:v];
//            break;
//        }
    }
}

- (void)showMentionViewWithImgName:(NSString *)name text:(NSString *)text superView:(UIView *)view {
    if ([Window viewWithTag:HiddenViewTag]) {
        [self showMentionViewWithImgName:name text:text];
    }else {
        [self createMentionViewWithImgName:name text:text superView:view];
        [self showMentionViewWithImgName:name text:text];
    }
}

- (void)showMentionViewWithImgName:(NSString *)name text:(NSString *)text {
    UIView *view = [Window viewWithTag:HiddenViewTag];
    for (UIView *v in view.subviews) {
        if ([v isMemberOfClass:[UIImageView class]]) {
            ((UIImageView *)v).image = [UIImage imageNamed:name];
        }
        if ([v isMemberOfClass:[UILabel class]]) {
            ((UILabel *)v).text = text;
        }
    }
    if (view && view.isHidden) {
        view.hidden = NO;
        [UIView animateWithDuration:1 animations:^{
            view.alpha = 1.0;
        }];
    }
}

- (void)hiddenMentionViewAnimated:(BOOL)animated {
    UIView *view = [Window viewWithTag:HiddenViewTag];
    if (animated) {
        if (view && view.isHidden == NO) {
            [UIView animateWithDuration:1 animations:^{
                view.alpha = 0.0;
            } completion:^(BOOL finished) {
                view.hidden = YES;
            }];
        }
    }else {
        view.hidden = YES;
    }
}

@end