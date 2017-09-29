//
//  PlacesVC.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "PlacesVC.h"

@interface PlacesVC ()
@end

@implementation PlacesVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrPlaces.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PlacesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlacesCell"];
    
    [cell reloadCell:_arrPlaces indexParh:indexPath];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PopUpVC *popUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
    
    CCMPopupTransitioning *popup = [CCMPopupTransitioning sharedInstance];
    popup.destinationBounds = CGRectMake(0, -30, 310, self.view.frame.size.height-90);
    popup.presentingController = self;
    popup.dismissableByTouchingBackground = YES;
    popup.backgroundViewColor = [UIColor blackColor];
    popup.presentedController = popUpVC;
    _popupController = popUpVC;
    popUpVC.dict = _arrPlaces[indexPath.row];
    
    [self presentViewController:popUpVC animated:YES completion:nil];
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    [UIView animateWithDuration:[coordinator transitionDuration] animations:^{
        
        _popupController.view.bounds = CGRectMake(0, 0, 270, 270);
        [self.view layoutIfNeeded];
    }];
}

@end
