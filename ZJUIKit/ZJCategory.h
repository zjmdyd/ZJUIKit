//
//  ZJCategory.h
//  ButlerSugar
//
//  Created by ZJ on 3/4/16.
//  Copyright © 2016 csj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJCategory : NSObject

@end

@interface UITableView (HYTableView)

/**
 *  @param cellIDs  数组中自定义的xib和系统的cell顺序排放
 *  @param nibCount 表示cellIDs中有多少个自定义cell的xib文件
 */

- (void)registerCellWithIDs:(NSArray *)cellIDs nibCount:(NSInteger)nibCount;

/**
 *  @param color 默认为lightGrayColor
 *  @param font  默认为系统字体15
 */
- (UIView *)createHeaderLabelWithText:(NSString *)text textColor:(UIColor *)color font:(UIFont *)font;

@end

@interface NSDictionary (HYDictionary)

- (BOOL)containsKey:(NSString *)key;

@end

@interface NSArray (HYNSArray)

/**
 *  适合元素是字符串的数组
 */
- (NSString *)changeToStringWithSeparator:(NSString *)separator;

@end

@interface NSMutableArray (HYMutableArray)

/**
 *  向子数组中添加元素
 */
- (void)addObject:(id)obj toSubAry:(NSMutableArray *)subAry;

@end

#pragma mark - extention

@interface UIViewController (HYViewController)

/**
 *  @param view 默认为self.viw
 */
- (void)showMentionViewWithImgName:(NSString *)name text:(NSString *)text superView:(UIView *)view;
- (void)hiddenMentionViewAnimated:(BOOL)animated;

@end