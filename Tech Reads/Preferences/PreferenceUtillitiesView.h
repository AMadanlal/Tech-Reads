//
//  PreferenceUtillitiesView.h
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/03/26.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

#ifndef PreferenceUtillitiesView_h
#define PreferenceUtillitiesView_h
#import <UIKit/UIKit.h>
#import "SavingUtilities.h"
#import "PreferenceUtilitiesPresenterView.h"

@interface PreferenceUtilitiesView : UIViewController  <UIPickerViewDelegate, UIPickerViewDataSource, PreferenceUtilitiesPresenterView>
@property (nonatomic, weak) IBOutlet UILabel *mediumLbl;
@property (nonatomic, weak) IBOutlet UILabel *mainPrefLabel;
@property (nonatomic, weak) IBOutlet UILabel *lblCurrentMedium;
@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong)NSArray *consoles;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnSaveOutlet;
@property SavingUtilities* savingClass;
- (void)viewDidLoad;
- (IBAction)btnSave:(UIButton *)sender;

@end

#endif /* PreferenceUtillitiesView_h */
