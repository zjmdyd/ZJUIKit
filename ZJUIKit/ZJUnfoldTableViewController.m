//
//  ZJUnfoldTableViewController.m
//  ZJUnflodTableView
//
//  Created by MCONE on 14-10-16.
//  Copyright (c) 2014年 huaan. All rights reserved.
//

#import "ZJUnfoldTableViewController.h"
#import "UIViewExt.h"

@interface ZJUnfoldTableViewController ()<UIScrollViewDelegate> {
//    NSInteger i;
    NSMutableArray *_headViews;
}

@property (nonatomic, strong) NSMutableArray *detailSectionTag;
@property (nonatomic, strong) NSMutableArray *titleAry;

@end

static NSString *CellIdentifier = @"cell";


@implementation ZJUnfoldTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self initAry];
}

- (void)initAry {
    self.detailSectionTag = [NSMutableArray array];
    self.titleAry = [NSMutableArray arrayWithObjects:@"第一组", @"第二组", @"第三组", nil];
    
    _headViews = [NSMutableArray array];
}

#pragma mark - Table view data source

//设置表头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    [headView setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 12, 15, 15)];
    NSString *string = [NSString stringWithFormat:@"%d", section];
    if ([self.detailSectionTag containsObject:string]) {
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_down@2x.png"];
    }else{
        imageView.image = [UIImage imageNamed:@"buddy_header_arrow_right@2x.png"];
    }
    [headView addSubview:imageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right+5, imageView.top-7, 80, 30)];
    titleLabel.text = [self.titleAry objectAtIndex:section];
    [headView addSubview:titleLabel];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 768, 40)];
    btn.tag = section;
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(open_closeDetailCell:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:btn];

    [_headViews addObject:headView];
    
    return headView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *string = [NSString stringWithFormat:@"%d", section];
    if ([self.detailSectionTag containsObject:string]) {
        return 8;
    }
    
    return 0;
}

- (void)open_closeDetailCell:(UIButton *)sender {
    NSString *string = [NSString stringWithFormat:@"%d", sender.tag];
    if ([self.detailSectionTag containsObject:string]) {
        [self.detailSectionTag removeObject:string];
    }else{
        [self.detailSectionTag addObject:string];
    }
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行", indexPath.row+1];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithRed:0.937255 green:0.937255 blue:0.956863 alpha:1];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
