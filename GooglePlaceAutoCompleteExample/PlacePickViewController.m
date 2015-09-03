//
//  PlacePickViewController.m
//  GooglePlaceAutoCompleteExample
//
//  Created by MaJixian on 9/3/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "PlacePickViewController.h"

@interface PlacePickViewController ()<PlacePickDelegate>
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;

@end

@implementation PlacePickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue"]) {
        ViewController *placePickerVC = [segue destinationViewController];
        placePickerVC.delegate = self;
    }
}

- (void)viewController:(ViewController *)placePickViewController didSelectPlace:(NSString *)placeString
{
    self.placeLabel.text = placeString;
    NSLog(@"label:%@",self.placeLabel.text);
    [placePickViewController.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
