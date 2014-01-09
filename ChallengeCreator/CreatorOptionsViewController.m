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



//@synthesize TaskForm;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    if(_TheDailyChallenge == nil)
    {
        _TheDailyChallenge = [[DailyChallenge alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_TheDailyChallenge == nil )
    {
        _TheDailyChallenge = [[DailyChallenge alloc] init];
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
//    PickerPopUpViewController *p = [segue destinationViewController];
//    p.options = _PickerPopUp.options;
//    p.title = _PickerPopUp.title;
//    p.list = _PickerPopUp.list;
//    p.PopDailyChallenge = [[DailyChallenge alloc] init];
//    p.PopDailyChallenge = _TheDailyChallenge;
    if ([segue.identifier isEqualToString:@"ToTaskForm"])
    {
        CreatorTaskFormViewController *t = [segue destinationViewController];
        t.listOfTasks = _TaskForm.listOfTasks;
        t.TaskFormDailyChallenge = _TheDailyChallenge;
    }
    else
    {
        PickerPopUpViewController *p = [segue destinationViewController];
        p.options = _PickerPopUp.options;
        p.title = _PickerPopUp.title;
        p.list = _PickerPopUp.list;
        p.PopDailyChallenge = [[DailyChallenge alloc] init];
        p.PopDailyChallenge = _TheDailyChallenge;
    }
}

- (IBAction)CreateChallenge:(id)sender {
}

- (IBAction)FilterLookingFor:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Looking For";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Female",@"Male",nil];
    NSMutableArray *list = _TheDailyChallenge.interestedInExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterLove:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Relationship Status";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Single",@"Dating", @"Committed", @"Married",@"Divorced", @"Widowed", @"Not Looking",nil];
    NSMutableArray *list = _TheDailyChallenge.relationshipLevelExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterSchool:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"School";
    NSMutableArray *list = _TheDailyChallenge.schoolLevelExcludes;
    _PickerPopUp.list = &(*list);
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Grade School (in)",@"Junior High (in)",@"High school (in)",@"College (in)",@"Grad School (in)",@"Grade School",@"Junior High",@"High School",@"College",@"Grad School",nil];
    
}
- (IBAction)FilterWork:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Work";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Part Time",@"Blue Collar",@"Professional",@"Scholarship",@"Trust Fund Baby", @"Credit", @"Welfare",nil];
    NSMutableArray *list = _TheDailyChallenge.workLevelExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterChildren:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Children";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"None",@"child",@"children",@"babies",@"toddlers", @"adult children", @"teenagers",@"babies", @"step children", @"nieces/nephews", @"grandchildren",nil];
    NSMutableArray *list = _TheDailyChallenge.kidsExclude;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterPets:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Pets";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"none",@"can't",@"cat/cats",@"dog/dogs", @"cats and dogs", @"rodents",@"reptiles", @"farm animals",nil];
    NSMutableArray *list = _TheDailyChallenge.petsExclude;
    _PickerPopUp.list = &(*list);
}

- (IBAction)addTask:(id)sender {
    _TaskForm = [[CreatorTaskFormViewController alloc] init];
    NSMutableArray *list = _TheDailyChallenge.tasks;
    _TaskForm.listOfTasks = &(*list);
}

- (IBAction)ExcludeSchoolHappy:(id)sender {
    if (_SchoolHappySwitch.on == true)
    {
        // never commit with bugs!!!!!
        _TheDailyChallenge.completed = true;
    }

}

- (IBAction)ExcludeWorkHappy:(id)sender {
}

- (IBAction)ExcludeLoveHappy:(id)sender {
}

- (IBAction)ExcludeFemales:(id)sender {
}
@end
