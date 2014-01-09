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
@synthesize PickerPopUp;
@synthesize Challenges;
@synthesize TheDailyChallenge;

@synthesize ListOfChanges;

@synthesize WorkingOn;

@synthesize TaskForm;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    if(TheDailyChallenge == nil)
    {
        TheDailyChallenge = [[DailyChallenge alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(TheDailyChallenge == nil )
    {
        TheDailyChallenge = [[DailyChallenge alloc] init];
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if ([segue.identifier isEqualToString:@"ToTaskForm"])
        {
            CreatorTaskFormViewController *t = [segue destinationViewController];
            t.listOfTasks = TaskForm.listOfTasks;
            t.TaskFormDailyChallenge = TheDailyChallenge;
        }
    else
    {
        PickerPopUpViewController *p = [segue destinationViewController];
        p.options = PickerPopUp.options;
        p.title = PickerPopUp.title;
        p.list = PickerPopUp.list;
        p.PopDailyChallenge = [[DailyChallenge alloc] init];
        p.PopDailyChallenge = TheDailyChallenge;
    }
    
}

- (IBAction)CreateChallenge:(id)sender {
}

- (IBAction)FilterLookingFor:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"Looking For";
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Female",@"Male",nil];
    NSMutableArray *list = TheDailyChallenge.interestedInExcludes;
    PickerPopUp.list = &(*list);
}
- (IBAction)FilterLove:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"Relationship Status";
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Single",@"Dating", @"Committed", @"Married",@"Divorced", @"Widowed", @"Not Looking",nil];
    NSMutableArray *list = TheDailyChallenge.relationshipLevelExcludes;
    PickerPopUp.list = &(*list);
}
- (IBAction)FilterSchool:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"School";
    NSMutableArray *list = TheDailyChallenge.schoolLevelExcludes;
    PickerPopUp.list = &(*list);
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Grade School (in)",@"Junior High (in)",@"High school (in)",@"College (in)",@"Grad School (in)",@"Grade School",@"Junior High",@"High School",@"College",@"Grad School",nil];
    
}
- (IBAction)FilterWork:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"Work";
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Part Time",@"Blue Collar",@"Professional",@"Scholarship",@"Trust Fund Baby", @"Credit", @"Welfare",nil];
    NSMutableArray *list = TheDailyChallenge.workLevelExcludes;
    PickerPopUp.list = &(*list);
}
- (IBAction)FilterChildren:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"Children";
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"None",@"child",@"children",@"babies",@"toddlers", @"adult children", @"teenagers",@"babies", @"step children", @"nieces/nephews", @"grandchildren",nil];
    NSMutableArray *list = TheDailyChallenge.kidsExclude;
    PickerPopUp.list = &(*list);
}
- (IBAction)FilterPets:(id)sender {
    PickerPopUp = [[PickerPopUpViewController alloc] init];
    PickerPopUp.title = @"Pets";
    PickerPopUp.options = [[NSArray alloc] initWithObjects:@"none",@"can't",@"cat/cats",@"dog/dogs", @"cats and dogs", @"rodents",@"reptiles", @"farm animals",nil];
    NSMutableArray *list = TheDailyChallenge.petsExclude;
    PickerPopUp.list = &(*list);
}

- (IBAction)addTask:(id)sender {
    TaskForm = [[CreatorTaskFormViewController alloc] init];
    NSMutableArray *list = TheDailyChallenge.tasks;
    TaskForm.listOfTasks = &(*list);
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
