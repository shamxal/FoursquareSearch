//
//  API_Connection.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "Header.h"
#import "API_Manager.h"
#import "API_Connection.h"

@implementation API_Connection

+(API_Connection *)sharedInstance
{
    static API_Connection *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    
    return _instance;
}

-(void)getSearchVenu:(NSString *)venue near:(NSString *)near success:( void(^) (id responseObject) )success failure:( void(^) (NSError *error) )failure
{
    NSDictionary *params;
    NSString *path = @"https://api.foursquare.com/v2/venues/search";
    if (near.length) {
        params = @{
                   @"near" : near,
                   @"query" : venue,
                   @"v" : @"20170101",
                   @"client_id" : clientID,
                   @"client_secret" : clientSecret
                   };
    } else {
        float lat = 41.00, lon = 28.66;
        params = @{
                   @"ll" : [NSString stringWithFormat:@"%f,%f", lat, lon],
                   @"query" : venue,
                   @"v" : @"20170101",
                   @"client_id" : clientID,
                   @"client_secret" : clientSecret
                   };
    }
    
    [[API_Manager sharedInstance] GET:path parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)getVenueDetail:(NSString *)Id success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@", Id];
    NSDictionary *params = @{
                             @"v" : @"20170101",
                             @"client_id" : clientID,
                             @"client_secret" : clientSecret
                             };
    
    [[API_Manager sharedInstance] GET:path parameters:params success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
