//
//  PopUpVC.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MMProgressHUD/MMProgressHUD.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "PopUpCell.h"
#import "API_Connection.h"
#import "AddressAnnotation.h"

@interface PopUpVC : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlace;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITableView *tablePopUp;

@property (strong, nonatomic) NSArray *arrItems;
@property (strong, nonatomic) NSDictionary *dict, *dictDetail;
@end
