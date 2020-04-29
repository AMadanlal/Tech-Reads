//
//  PreferenceUtilitiesView.m
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/03/26.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "PreferenceUtillitiesView.h"
#import "Tech_Reads-Swift.h"

@implementation PreferenceUtilitiesView : UIViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.consoles = @[@"Any", @"PC", @"XONE", @"PS4", @"Switch", @"iOS"];
  self.pickerView.delegate = self;
  self.pickerView.dataSource = self;
  self.lblCurrentMedium.accessibilityIdentifier = @"lblpreference";
  [self.mediumLbl setFont:[UIFont fontWithName:@"italicSystemFont" size:15]];
  [self.pickerView setValue:UIColor.whiteColor forKey: @"textColor"];
  self.savingClass = [[SavingUtilities alloc] init];
  SaveUtilityPresenter* utilityPresenter = [[SaveUtilityPresenter alloc] init];
  [utilityPresenter setViewWithView:self];
  [utilityPresenter loadMediumStringFromDB];
  [self setUI];
  self.view.layer.borderColor = [UIColor blueColor].CGColor;
  self.view.layer.cornerRadius = 30.0f;
  self.view.layer.borderWidth = 5.0f;
}

- (void)setUI {
  PreferenceButtonModification* buttonModificationClass = [[PreferenceButtonModification alloc] init];
  [buttonModificationClass setUpButtonWithButton:(self.btnSaveOutlet)];
  [buttonModificationClass setUpLabelWithLabel:(self.instructionsLabel)];
}

- (void)viewDidLayoutSubviews {
  [self setUI];
}
- (IBAction)btnBack:(UIButton *)sender {
//  this unwinds the segue
}

- (IBAction)btnSave:(UIButton *)sender {
  NSString *answer = self.consoles[[self.pickerView selectedRowInComponent:0]];
  SaveUtilityPresenter* utilityPresenter = [[SaveUtilityPresenter alloc] init];
  [utilityPresenter setViewWithView:self];
  [utilityPresenter saveMediumStringWithStringToSave:answer];
  [utilityPresenter saveMediumStringToDBWithStringToSave:answer];
  [utilityPresenter loadMediumStringFromDB];
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


- (void)updateLabel:(NSString *)gamingMedium {
  self.lblCurrentMedium.text = gamingMedium;
}

@end
