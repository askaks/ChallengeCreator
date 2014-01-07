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


@class PickerPopUpViewController;

@interface CreatorOptionsViewController : UIViewController
{
    PickerPopUpViewController *PickerPopUp;
}
@property (nonatomic, retain) NSMutableArray *Challenges;


@property (nonatomic, retain) PickerPopUpViewController *PickerPopUp;

@property (weak, nonatomic) IBOutlet UITextField *ChallengeTitle;
@property (weak, nonatomic) IBOutlet UITextField *AgeMin;
@property (weak, nonatomic) IBOutlet UITextField *AgeMax;
@property (weak, nonatomic) IBOutlet UITextField *RiskFactor;
@property (weak, nonatomic) IBOutlet UITextField *LanguageRating;

@property (weak, nonatomic) IBOutlet UISwitch *ExcludeFemalesSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *SchoolHappySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *WorkHappySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *LoveHappySwitch;

@property (weak, nonatomic) IBOutlet UIButton *LookingFilter;
@property (weak, nonatomic) IBOutlet UIButton *SchoolFilter;
@property (weak, nonatomic) IBOutlet UIButton *LoveFilter;
@property (weak, nonatomic) IBOutlet UIButton *WorkFilter;
@property (weak, nonatomic) IBOutlet UIButton *ChildFilter;
@property (weak, nonatomic) IBOutlet UIButton *PetFilter;


@property (weak, nonatomic) IBOutlet UITextView *LookingInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *SchoolInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *LoveInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *WorkInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *ChildInfoBox;
@property (weak, nonatomic) IBOutlet UITextView *PetInfoBox;

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



@property (weak, nonatomic) IBOutlet UIButton *CreateChallengeButton;


@end
