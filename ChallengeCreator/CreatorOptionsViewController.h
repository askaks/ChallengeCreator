//
//  CreatorOptionsViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorViewController.h"
@interface CreatorOptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ChallengeTitle;
@property (weak, nonatomic) IBOutlet UITextField *AgeMin;
@property (weak, nonatomic) IBOutlet UITextField *AgeMax;
@property (weak, nonatomic) IBOutlet UIButton *SchoolFilters;
@property (weak, nonatomic) IBOutlet UITextField *RiskFactor;
@property (weak, nonatomic) IBOutlet UITextField *LanguageRating;
@property (weak, nonatomic) IBOutlet UIButton *CreateChallengeButton;
- (IBAction)CreateChallenge:(id)sender;
- (IBAction)AddSchoolFilters:(id)sender;

@end
