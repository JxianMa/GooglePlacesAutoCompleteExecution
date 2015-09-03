//
//  ViewController.m
//  GooglePlaceAutoCompleteExample
//
//  Created by MaJixian on 9/3/15.
//  Copyright (c) 2015 MaJixian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSArray *cityName;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cityNameTextField isFirstResponder];
    [self setUpTextFieldKeyboard];
    self.tableView.layer.borderColor = ([UIColor lightGrayColor]).CGColor;
    self.tableView.layer.borderWidth = 1.0f;
    [self.tableView setHidden:YES];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(placeChosenCompleted)];
    self.navigationItem.rightBarButtonItem = doneBtn;
    // Do any additional setup after loading the view.
}

- (void)setUpTextFieldKeyboard
{
    UIToolbar* doneToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    doneToolbar.barStyle = UIBarStyleDefault;
    doneToolbar.items = [NSArray arrayWithObjects:
                         [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                         [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClickedDismissKeyboard)],
                         nil];
    [doneToolbar sizeToFit];
    self.cityNameTextField.inputAccessoryView = doneToolbar;
}

-(void)doneButtonClickedDismissKeyboard
{
    [self.cityNameTextField resignFirstResponder];
}

- (IBAction)textViewValueChanged:(UITextField *)sender
{
    [self placePickerRequestWithInput:sender.text];
    [self.tableView setHidden:NO];
    NSLog(@"sender.text:%@",sender.text);
}

- (void)placePickerRequestWithInput:(NSString *)input
{
    GoogleAutoCompletePlaces *autoCompleteRequest = [[GoogleAutoCompletePlaces alloc]init];
    
    // Parameters can be changed according to Google's documentations, you need to include your google api key as a parameter before sending request.
    
    NSDictionary *parameters = @{@"types":@"(cities)",@"sensor":@"false",@"key":googleAPIkey, @"input":input};
    [autoCompleteRequest getGeoLocationWithParameters:parameters outPutWithBlock:^(NSArray *geolocationArrray, NSError *error) {
        if (!error) {
            NSLog(@"geolocaitonArray:%@",geolocationArrray);
            cityName = geolocationArrray;
            [self.tableView reloadData];
        }else {
            NSLog(@"Something is wrong!");
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cityName count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cityPredictionCell";
    UITableViewCell *cityPredictionCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cityPredictionCell) {
        cityPredictionCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *cityNameString = [cityName objectAtIndex:indexPath.row];
    NSLog(@"cityNameString:%@",cityNameString);
    cityPredictionCell.textLabel.text = cityNameString;
    return cityPredictionCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"chosenCell:%@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text);
    self.cityNameTextField.text = [tableView cellForRowAtIndexPath:indexPath].textLabel.text ;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self doneButtonClickedDismissKeyboard];
}

- (void)placeChosenCompleted
{
    id<PlacePickDelegate> delegate = self.delegate;
    [delegate viewController:self didSelectPlace:self.cityNameTextField.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
