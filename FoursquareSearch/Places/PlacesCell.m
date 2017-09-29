//
//  PlacesCell.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "PlacesCell.h"

@implementation PlacesCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)reloadCell:(NSArray *)arr indexParh:(NSIndexPath *)indexPath {
    
    _lblTitle.text = arr[indexPath.row][@"name"];
    _lblDesc.text = arr[indexPath.row][@"location"][@"address"];
    _lblCountry.text = arr[indexPath.row][@"location"][@"country"];
}

@end
