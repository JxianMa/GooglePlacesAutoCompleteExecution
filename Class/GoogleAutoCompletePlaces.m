//
//  GoogleAutoCompletePlaces.m
//  GooglePlaceAutoCompleteExample
//
//  Created by MaJixian on 9/3/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "GoogleAutoCompletePlaces.h"

@implementation GoogleAutoCompletePlaces

- (void)getGeoLocationWithParameters:(NSDictionary *)parameters outPutWithBlock:(void (^)(NSArray *geolocationArrray, NSError *error))block

{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *cityNameArray = [[NSMutableArray alloc]init];
        NSArray *resultArray = [responseObject objectForKey:@"predictions"];
        for (NSDictionary *resultDict in resultArray) {
            [cityNameArray addObject:[resultDict objectForKey:@"description"]];
        }
        if (block) {
            block([NSArray arrayWithArray:cityNameArray],nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
}


@end
