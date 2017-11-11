//
//  API_Manager.m
//  FoursquareSearch
//
//  Created by Shamkhal Guliyev on 29.09.2017.
//  Copyright © 2017 Shamkhal Guliyev. All rights reserved.
//

#import "API_Manager.h"

@implementation API_Manager

+(API_Manager *)sharedInstance
{
    static API_Manager *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    
    return _instance;
}

-(void)GET:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    [responseSerializer setRemovesKeysWithNullValues:YES];
    [manager setResponseSerializer:responseSerializer];
    
    [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
