//
//  Location.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 11.11.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *country;
@end
