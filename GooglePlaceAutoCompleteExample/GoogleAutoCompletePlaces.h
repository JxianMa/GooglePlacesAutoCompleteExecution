//
//  GoogleAutoCompletePlaces.h
//  GooglePlaceAutoCompleteExample
//
//  Created by MaJixian on 9/3/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface GoogleAutoCompletePlaces : NSObject

- (void)getGeoLocationWithParameters:(NSDictionary *)parameters outPutWithBlock:(void (^)(NSArray *geolocationArrray, NSError *error))block;

@end
