//
//  PlacesVC.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CCMPopup/CCMPopupTransitioning.h>

#import "PopUpVC.h"
#import "PlacesCell.h"

@interface PlacesVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tablePlaces;

@property (strong, nonatomic) NSArray *arrPlaces;
@property (weak) UIViewController *popupController;
@end
