//
//  ViewController.h
//  GooglePlaceAutoCompleteExample
//
//  Created by MaJixian on 9/3/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlacePickViewController.h"
#import "GoogleAutoCompletePlaces.h"
#import "GoogleAPIKey.h"

@protocol PlacePickDelegate;
@interface ViewController : UIViewController

@property(nonatomic,weak)id<PlacePickDelegate> delegate;
@property BOOL isFromSourceSegue;

@end
@protocol PlacePickDelegate <NSObject>

- (void)viewController:(ViewController *)placePickViewController didSelectPlace:(NSString *)placeString;

@required



@end

