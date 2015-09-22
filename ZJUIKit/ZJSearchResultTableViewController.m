//
//  ZJSearchResultTableViewController.m
//  ZJUIKit
//
//  Created by YunTu on 15/7/9.
//  Copyright (c) 2015年 YunTu. All rights reserved.
//

#import "ZJSearchResultTableViewController.h"

@interface ZJSearchResultTableViewController () {
    NSMutableArray *_dataList;
    NSString *_address;
    CLGeocoder *_geocoder;
}

@end

static NSString *CELLID = @"cell";

@implementation ZJSearchResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = [NSMutableArray array];
    
    self.userLocation = [[CLLocation alloc] initWithLatitude:22.58116231 longitude:113.96461388];
    _geocoder=[[CLGeocoder alloc]init];
}

-(void)getCoordinateByAddress:(NSString *)address{
    [_dataList removeAllObjects];
    
    //地理编码
    //    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
    //        _dataList = [placemarks mutableCopy];
    //        [self.tableView reloadData];
    //    }];
    NSLog(@"userLocation = %@", self.userLocation);
    CLCircularRegion *reg = [[CLCircularRegion alloc] initWithCenter:self.userLocation.coordinate radius:100000 identifier:@"aa"];
    
    [_geocoder geocodeAddressString:address inRegion:reg completionHandler:^(NSArray *placemarks, NSError *error) {
        _dataList = [placemarks mutableCopy];
        [self.tableView reloadData];
    }];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    _address = searchController.searchBar.text;
    [self getCoordinateByAddress:searchController.searchBar.text];
    [self.tableView reloadData];
/*
    NSString *text = searchController.searchBar.text;
    if (text.integerValue) {
        [_dataList removeAllObjects];
        for (int i = 0; i < text.integerValue; i++) {
            [_dataList addObject:[NSNumber numberWithInteger:i]];
        }
    }
    [self.tableView reloadData];
*/
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELLID];
    }
    
    CLPlacemark *placemark = _dataList[indexPath.row];
    CLLocation *location = placemark.location;  //位置
    CLRegion *region = placemark.region;//区域
    NSDictionary *addressDic = placemark.addressDictionary; //详细地址信息字典,包含以下部分信息
    NSLog(@"addressDic = %@", addressDic);
    for (NSString *key in addressDic.allKeys) {
        if ([addressDic[key] isKindOfClass:[NSString class]]) {
            NSLog(@"key = %@, value = %@", key, [addressDic objectForKey:key]);
        }else {
//            NSLog(@"class = %@", [addressDic[key] class]);
            for (id obj in addressDic[key]) {
                NSLog(@"key = %@, obj = %@", key, obj);
            }
        }
    }
    
    NSString *name = placemark.name;//地名
    NSString *thoroughfare = placemark.thoroughfare;//街道
    NSString *subThoroughfare = placemark.subThoroughfare; //街道相关信息，例如门牌等
    NSString *locality = placemark.locality; // 城市
    NSString *subLocality = placemark.subLocality; // 城市相关信息，例如标志性建筑
    NSString *administrativeArea = placemark.administrativeArea; // 州
    NSString *subAdministrativeArea = placemark.subAdministrativeArea; //其他行政区域信息
    NSString *postalCode = placemark.postalCode; //邮编
    NSString *ISOcountryCode = placemark.ISOcountryCode; //国家编码
    NSString *country = placemark.country; //国家
    NSString *inlandWater = placemark.inlandWater; //水源、湖泊
    NSString *ocean = placemark.ocean; // 海洋
    NSArray *areasOfInterest = placemark.areasOfInterest; //关联的或利益相关的地标
    NSLog(@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n\n\n",name, thoroughfare, subThoroughfare, locality, subLocality, administrativeArea, subAdministrativeArea, postalCode, ISOcountryCode, country, inlandWater, ocean, areasOfInterest, location, region);
    
    NSString *text = [placemark.name componentsSeparatedByString:[_address substringToIndex:1]][1];;
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@", [_address substringToIndex:1], text];
    
    NSMutableString *deatilText = [[NSMutableString alloc] init];
    if (administrativeArea.length) {
        [deatilText appendString:administrativeArea];
    }
    if (locality.length) {
        [deatilText appendString:locality];
    }
    if (subLocality.length) {
        [deatilText appendString:subLocality];
    }
    cell.detailTextLabel.text = deatilText;
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

/*
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"%s", __func__);
}

- (void)didPresentSearchController:(UISearchController *)searchController {
    NSLog(@"%s", __func__);
}
*/

/*
-(void)getCoordinateByAddress:(NSString *)address{
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
        CLPlacemark *placemark = [placemarks firstObject];
        
        CLLocation *location=placemark.location;//位置
        CLRegion *region=placemark.region;//区域
        NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
        //        NSString *name=placemark.name;//地名
        //        NSString *thoroughfare=placemark.thoroughfare;//街道
        //        NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
        //        NSString *locality=placemark.locality; // 城市
        //        NSString *subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
        //        NSString *administrativeArea=placemark.administrativeArea; // 州
        //        NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
        //        NSString *postalCode=placemark.postalCode; //邮编
        //        NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
        //        NSString *country=placemark.country; //国家
        //        NSString *inlandWater=placemark.inlandWater; //水源、湖泊
        //        NSString *ocean=placemark.ocean; // 海洋
        //        NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
        NSLog(@"位置:%@,区域:%@,详细信息:%@",location,region,addressDic);
    }];
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
