//
//  API_Connection.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface API_Connection : NSObject

+(API_Connection *)sharedInstance;

-(void)getSearchVenu:(NSString *)venue near:(NSString *)near success:( void(^) (id responseObject) )success failure:( void(^) (NSError *error) )failure;

-(void)getVenueDetail:(NSString *)Id success:( void(^) (id responseObject) )success failure:( void(^) (NSError *error) )failure;
@end
