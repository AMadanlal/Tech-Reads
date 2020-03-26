//
//  PreferenceUtilitiesView.m
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/03/26.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PreferenceUtillitiesView.h"
#import "TechReadsPod-Swift.h"

@implementation PreferenceUtilitiesView : UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.consoles = @[@"Any", @"PC", @"XBOX ONE", @"PS4", @"NINTENDO SWITCH", @"MOBILE"];
  self.pickerView.delegate = self;
  self.pickerView.dataSource = self;
  self.lblCurrentMedium.accessibilityIdentifier = @"lblpreference";
  [self.mainPrefLabel setFont:[UIFont fontWithName:@"italicSystemFont" size:35]];
  [self.mediumLbl setFont:[UIFont fontWithName:@"italicSystemFont" size:20]];
  [self.genreLbl setFont:[UIFont fontWithName:@"italicSystemFont" size:20]];
  [self.mainPrefLabel setNumberOfLines:2];
  [self.pickerView setValue:UIColor.blueColor forKey: @"textColor"];
//  self.mainPrefLabel.center.x = self.view.center.x; TODO: Find the obj-c conversion of this line
  self.savingClass = [[SavingUtilities alloc] init];
  self.lblCurrentMedium.text = [self.savingClass LoadMedium];
  
}

- (IBAction)btnSave:(UIButton *)sender {
//   NSString *answer = self.consoles[pickerView.selectedRow(inComponent: 0)];
    NSString *answer = @"Hello"; //just for testing
    PreferenceUtilities* utilities =  [[PreferenceUtilities alloc] init];
//  [utilities saveMedium];
    self.lblCurrentMedium.text = [self.savingClass LoadMedium];
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
  return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return self.consoles.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return self.consoles[row];
}


@end
