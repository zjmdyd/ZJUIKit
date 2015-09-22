//
//  ZJSearchResultTableViewController.h
//  ZJUIKit
//
//  Created by YunTu on 15/7/9.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ZJSearchResultTableViewController : UITableViewController <UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) CLLocation *userLocation;

@end
