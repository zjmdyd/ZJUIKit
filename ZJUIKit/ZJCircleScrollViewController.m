//
//  ZJCircleScrollViewController.m
//  ZJScrollView
//
//  Created by YunTu on 14/12/17.
//  Copyright (c) 2014年 YunTu. All rights reserved.
//

#import "ZJCircleScrollViewController.h"
#import "UIViewExt.h"

@interface ZJCircleScrollViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *subViews;
@property (nonatomic, strong) NSMutableArray *colors;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation ZJCircleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initAry];
    [self loadSubViews];
}

- (void)initAry {
    self.subViews = [NSMutableArray array];
    self.titles = [NSMutableArray arrayWithObjects:@"5", @"1", @"2", @"3", @"4", nil];
    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor colorWithRed:0 green:10 blue:0 alpha:1],
                   [UIColor colorWithRed:10 green:10 blue:0 alpha:0.8],
                   [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6],
                   [UIColor colorWithRed:20 green:0 blue:20 alpha:0.5],
                   [UIColor colorWithRed:0 green:120 blue:10 alpha:0.7],
                   nil];
}

- (void)loadSubViews {
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];    //320, 568

    [self.view addSubview:self.scrollView];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width * self.titles.count, self.scrollView.height);
    self.scrollView.delegate = self;
    
    for (int i = 0; i < self.titles.count; i++) {
        UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(i*self.scrollView.width, 0, self.scrollView.width, self.scrollView.height)];
        subView.backgroundColor = self.colors[i];
        [self.scrollView addSubview:subView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(160-100, 284-70, 200, 100)];
        label.text = self.titles[i];
        label.font = [UIFont systemFontOfSize:25];
        label.textAlignment = NSTextAlignmentCenter;
        [label setBackgroundColor:[UIColor redColor]];
        
        [subView addSubview:label];
        
        [self.subViews addObject:subView];
    }
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.width, 0) animated:NO];
    
    //加入pageController
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 20)];
    self.pageControl.numberOfPages = self.titles.count;
    self.pageControl.userInteractionEnabled = NO;                        //关闭用户交互功能,即用户不能点击pageControl实现切换
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor]; //设置当前的pageControl的颜色
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];      //设置非当前的pageControl的颜色
    [self.view addSubview:self.pageControl];
}

- (void)setFrame {
    for (int i = 0; i < self.subViews.count; i++) {
        UIView *view = self.subViews[i];
        view.frame = CGRectMake(i*self.scrollView.width, 0, self.scrollView.width, self.scrollView.height);
    }
}

//向右
- (void)pageMoveToRight {
    UIView *tempView = [self.subViews lastObject];
    [self.subViews removeObjectAtIndex:self.subViews.count-1];
    [self.subViews insertObject:tempView atIndex:0];
    [self setFrame];
}

//向左
- (void)pageMoveToLeft {
    UIView *tempView = [self.subViews firstObject];
    [self.subViews removeObjectAtIndex:0];
    [self.subViews insertObject:tempView atIndex:self.subViews.count];
    [self setFrame];
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int page = floor((scrollView.contentOffset.x - pageWidth - pageWidth / 2) / pageWidth) + 1;     //向下取整
    NSLog(@"end_x = %f, page = %d", scrollView.contentOffset.x, page);
    if(page > 0) {              //向左
        [self pageMoveToLeft];
        self.pageControl.currentPage = (++self.pageControl.currentPage)%self.titles.count;
    } else if (page < 0) {      //向右
        [self pageMoveToRight];
        self.pageControl.currentPage = (--self.pageControl.currentPage+self.pageControl.numberOfPages)%self.titles.count;
    } else {}                   //不变
    
    [scrollView setContentOffset:CGPointMake(pageWidth, 0) animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 位置分析:
 
 scrollView.contentOffset.x contentOffset.x默认是从width开始 所以推理没有-1.5*width,因为会抵消一个width
 一、 小于0.5*widh
	e.g:   (0.1*width-0.5*width) —> -0.4*width/width =  -0.4 —> -1 —> 0
 二、大于0.5*width
	e.g.:  (0.6*width-0.5*width) —> 0.1*width/width =   0.1 —>  0 —> 1
 三、大于-0.5*width
	e.g:  (-0.1*width-0.5*width) —> -0.6*width/width = -0.6 —> -1 —> 0
 四、	小于-0.5*width
	e.g  (-0.6*width-0.5*width) —> -1.1*width/width = -1.1 —> -2 —> -1
 
 所以结果有三种情况:
 -1	向右滑动
 0	位置不变
 1	向左滑动
 
 向右
 for (NSUInteger i = self.subViews.count-1; i > 0; i--) {
 UIView *view = self.subViews[i-1];
 [self.subViews replaceObjectAtIndex:i withObject:view];
 }
 [self.subViews replaceObjectAtIndex:0 withObject:tempView];
 
 向左
 for (int i = 0; i < self.subViews.count-1; i++) {
 UIView *view = self.subViews[i+1];
 [self.subViews replaceObjectAtIndex:i withObject:view];
 }
 [self.subViews replaceObjectAtIndex:self.subViews.count-1 withObject:tempView];
 
 */

@end
