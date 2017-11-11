//
//  MainVC.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)btnSearch:(id)sender {
    
    if (_txtFieldPlace.text.length < 3) {
        UIAlertView *alert = [UIAlertView bk_showAlertViewWithTitle:@"" message:@"Place name should be minimum 3 character" cancelButtonTitle:@"Done" otherButtonTitles:nil handler:nil];
        [alert show];
        
    } else {
        [MMProgressHUD showWithTitle:@"Loading"];
        [[API_Connection sharedInstance] getSearchVenu:_txtFieldPlace.text near:_txtFieldLocation.text success:^(id responseObject) {
            
            PlacesVC *placesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PlacesVC"];
            placesVC.arrPlaces = responseObject[@"response"][@"venues"];
            [self.navigationController showViewController:placesVC sender:nil];
            
            [MMProgressHUD dismiss];
            
        } failure:^(NSError *error) {
            [MMProgressHUD dismiss];
        }];
    }
}

@end
