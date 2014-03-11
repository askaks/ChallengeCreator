//
//  PickerPopUpViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/5/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorOptionsViewController.h"
#import "DailyChallenge.h"

@class DailyChallenge;

@class CreatorOptionsViewController;

@interface PickerPopUpViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, retain) NSMutableArray *Challenges;
@property (nonatomic, retain) DailyChallenge *PopDailyChallenge;
@property (nonatomic, retain) NSMutableArray *list;
@property NSInteger currentIndex;
@property (nonatomic, retain) NSMutableArray *options;
@property (nonatomic, retain) NSString *myTitle; // name title exist in UIViewController, read warnings, that's was a bad name for a variable!!!! TEST THE CODE!!!
@property (weak, nonatomic) IBOutlet UILabel *PickerLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (weak, nonatomic) IBOutlet UIButton *RemoveButton;
@property (weak, nonatomic) IBOutlet UIButton *AddButton;


- (IBAction)Add:(id)sender;
- (IBAction)Remove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;
//- (IBAction)Done:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *InfoBox;

@end
