//
//  CreatorOptionsViewController.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "CreatorOptionsViewController.h"

@interface CreatorOptionsViewController ()

@end

@implementation CreatorOptionsViewController

@synthesize SchoolFilter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CreateChallenge:(id)sender {
}

- (IBAction)FilterLookingFor:(id)sender {
}
- (IBAction)FilterLove:(id)sender {
}
- (IBAction)FilterSchool:(id)sender {
}
- (IBAction)FilterWork:(id)sender {
}
- (IBAction)FilterChildren:(id)sender {
}
- (IBAction)FilterPets:(id)sender {
}

- (IBAction)ExcludeSchoolHappy:(id)sender {
}

- (IBAction)ExcludeWorkHappy:(id)sender {
}

- (IBAction)ExcludeLoveHappy:(id)sender {
}

- (IBAction)ExcludeFemales:(id)sender {
}
@end
