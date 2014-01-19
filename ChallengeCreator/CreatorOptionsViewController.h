//
//  CreatorOptionsViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorViewController.h"
#import "PickerPopUpViewController.h"
#import "DailyChallenge.h"

#import "Task.h"
#import "CreatorTaskFormViewController.h"

@class PickerPopUpViewController;
@class DailyChallenge;

@class Task;
@class CreatorTaskFormViewController;

@interface CreatorOptionsViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>


@property (nonatomic, retain) NSMutableArray *Challenges;

@property (nonatomic, retain) NSMutableArray *ListOfChanges;

@property (nonatomic, retain) DailyChallenge *TheDailyChallenge;
@property (nonatomic, retain) PickerPopUpViewController *PickerPopUp;
@property (nonatomic, retain) CreatorTaskFormViewController *TaskForm;
@property (nonatomic, retain) NSString *WorkingOn;

@property (weak, nonatomic) IBOutlet UITextField *ChallengeTitle;
@property (weak, nonatomic) IBOutlet UITextField *ageMinField;
@property (weak, nonatomic) IBOutlet UITextField *ageMaxField;
@property (weak, nonatomic) IBOutlet UITextField *RiskFactor;
@property (weak, nonatomic) IBOutlet UITextField *LanguageRating;

@property (weak, nonatomic) IBOutlet UISwitch *ExcludeFemalesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SchoolHappySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *WorkHappySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LoveHappySwitch;
@property (weak, nonatomic) IBOutlet UILabel *challengePoints;

@property (weak, nonatomic) IBOutlet UIButton *LookingFilter;
@property (weak, nonatomic) IBOutlet UIButton *SchoolFilter;
@property (weak, nonatomic) IBOutlet UIButton *LoveFilter;
@property (weak, nonatomic) IBOutlet UIButton *WorkFilter;
@property (weak, nonatomic) IBOutlet UIButton *ChildFilter;
@property (weak, nonatomic) IBOutlet UIButton *PetFilter;
@property (weak, nonatomic) IBOutlet UIButton *femaleFilter;


@property (weak, nonatomic) IBOutlet UITextView *LookingInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *SchoolInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *LoveInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *WorkInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *ChildInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *PetInfoBox;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (weak, nonatomic) IBOutlet UITextView *genderInfoBox;
@property (weak, nonatomic) IBOutlet UIButton *CreateChallengeButton;


- (IBAction)doneAddingChallenges:(id)sender;
- (IBAction)setChallengeTitle:(id)sender;

- (IBAction)addTask:(id)sender;

- (IBAction)ExcludeSchoolHappy:(id)sender;
- (IBAction)ExcludeWorkHappy:(id)sender;
- (IBAction)ExcludeLoveHappy:(id)sender;
- (IBAction)ExcludeFemales:(id)sender;

- (IBAction)FilterLookingFor:(id)sender;
- (IBAction)FilterLove:(id)sender;
- (IBAction)FilterSchool:(id)sender;
- (IBAction)FilterWork:(id)sender;
- (IBAction)FilterChildren:(id)sender;
- (IBAction)FilterPets:(id)sender;

- (IBAction)setAgeMinField:(id)sender;
- (IBAction)setAgeMaxField:(id)sender;
- (IBAction)setLanguage:(id)sender;
- (IBAction)setRiskFactor:(id)sender;
- (IBAction)filterGenderExclusions:(id)sender;

- (NSString *)challengesPath;
- (void)archiveChallenges:(NSMutableArray *)array;
- (NSMutableArray *)unarchiveChallenges;

@end
