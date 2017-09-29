//
//  API_Manager.h
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface API_Manager : NSObject

+(API_Manager *)sharedInstance;

-(void)GET:(NSString *)path parameters:(NSDictionary *)parameters success:( void(^) (id responseObject) )success failure:( void(^) (NSError *error) )failure;

@end
