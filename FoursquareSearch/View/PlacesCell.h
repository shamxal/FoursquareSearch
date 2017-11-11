//
//  PlacesCell.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblCountry;

-(void)reloadCell:(NSArray *)arr indexParh:(NSIndexPath *)indexPath;

@end
