//
//  PopUpVC.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "PopUpVC.h"

@interface PopUpVC ()
@end

@implementation PopUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MMProgressHUD show];
    [[API_Connection sharedInstance] getVenueDetail:_dict[@"id"] success:^(id responseObject) {
        
        _dictDetail = responseObject[@"response"][@"venue"];
        _arrItems = _dictDetail[@"tips"][@"groups"][0] [@"items"];
        _lblTitle.text = _dict[@"name"];
        
        NSString *urlPrefix, *urlSuffix;
        if ([_dictDetail[@"photos"][@"groups"] count]) {
            urlPrefix = _dictDetail[@"photos"][@"groups"][0][@"items"][0][@"prefix"];
            urlSuffix = _dictDetail[@"photos"][@"groups"][0][@"items"][0][@"suffix"];
            
            NSString *url = [NSString stringWithFormat:@"%@310x200%@", urlPrefix, urlSuffix];
            [_imgPlace sd_setImageWithURL:[NSURL URLWithString:url]];
        }
        
        [_tablePopUp reloadData];
        [MMProgressHUD dismiss];
        
    } failure:^(NSError *error) {
        [MMProgressHUD dismiss];
    }];
    
    _mapView.delegate = self;
    
    CLLocationCoordinate2D  coordinatePoint;
    coordinatePoint.latitude = [_dict[@"location"][@"lat"] floatValue];
    coordinatePoint.longitude = [_dict[@"location"][@"lng"] floatValue];
    
    AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:coordinatePoint];
    [_mapView addAnnotation:addAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

-(void)updateMapZoomLocation:(CLLocation *)newLocation {
    
    MKCoordinateRegion region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude = newLocation.coordinate.longitude;
    region.span.latitudeDelta = 0.1;
    region.span.longitudeDelta = 0.1;
    [_mapView setRegion:region animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    [self updateMapZoomLocation:newLocation];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _arrItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PopUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PopUpCell"];
    cell.lblComment.text = _arrItems[indexPath.row][@"text"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

@end
