//
//  AddressAnnotation.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate;

-(NSString *)subtitle {
    
    return nil;
}

-(NSString *)title {
    
    return nil;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinatePoint {
    
    coordinate = coordinatePoint;
    
    return self;
}

@end
