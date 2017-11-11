//
//  MainVC.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIAlertView+BlocksKit.h>
#import <MMProgressHUD/MMProgressHUD.h>

#import "PlacesVC.h"
#import "API_Connection.h"

@interface MainVC : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtFieldPlace;
@property (weak, nonatomic) IBOutlet UITextField *txtFieldLocation;

@end
