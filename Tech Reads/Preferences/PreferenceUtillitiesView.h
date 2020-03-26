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

@interface PreferenceUtilitiesView : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *mediumLbl;
@property (nonatomic, weak) IBOutlet UILabel *mainPrefLabel;
@property (nonatomic, weak) IBOutlet UILabel *genreLbl;
@property (nonatomic, weak) IBOutlet UILabel *lblCurrentMedium;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

- (IBAction)btnSave:(UIButton *)sender;

@end

#endif /* PreferenceUtillitiesView_h */
