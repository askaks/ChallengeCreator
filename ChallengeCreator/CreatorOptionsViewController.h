//
//  CreatorOptionsViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreatorOptionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ChallengeTitle;
@property (weak, nonatomic) IBOutlet UITextField *AgeMin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *AgeMax;
@property (weak, nonatomic) IBOutlet UILabel *RiskFactor;
@property (weak, nonatomic) IBOutlet UILabel *LanguageRating;
@property (weak, nonatomic) IBOutlet UIButton *CreateChallengeButton;
- (IBAction)CreateChallenge:(id)sender;

@end
