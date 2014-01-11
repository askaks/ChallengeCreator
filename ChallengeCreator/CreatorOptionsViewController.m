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
        if(_TheDailyChallenge == nil)
        {
            _TheDailyChallenge = [[DailyChallenge alloc] init];
        }
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
    
    else
    {
        _challengePoints = [NSString stringWithFormat:@"%d", _TheDailyChallenge.pointsWorth];
        
        if(_TheDailyChallenge.interestedInExcludes != nil)
        {
            _LookingInfoBox.text = [_TheDailyChallenge.interestedInExcludes componentsJoinedByString:@"  "];
        }
        if(_TheDailyChallenge.schoolLevelExcludes != nil)
        {
            _SchoolInfoBox.text = [_TheDailyChallenge.schoolLevelExcludes componentsJoinedByString:@"  "];
        }
        if(_TheDailyChallenge.workLevelExcludes != nil)
        {
            _WorkInfoBox.text = [_TheDailyChallenge.workLevelExcludes componentsJoinedByString:@"  "];
        }
        if(_TheDailyChallenge.relationshipLevelExcludes != nil)
        {
            _LoveInfoBox.text = [_TheDailyChallenge.relationshipLevelExcludes componentsJoinedByString:@"  "];
        }
        if(_TheDailyChallenge.kidsExclude != nil)
        {
            _ChildInfoBox.text = [_TheDailyChallenge.kidsExclude componentsJoinedByString:@"  "];
        }
        if(_TheDailyChallenge.petsExclude != nil)
        {
            _PetInfoBox.text = [_TheDailyChallenge.petsExclude componentsJoinedByString:@"  "];
        }
   
    }
	// Do any additional setup after loading the view.
//    _AgeMax.returnKeyType = UIReturnKeyDone;
//    _AgeMin.returnKeyType = UIReturnKeyDone;
//    _LanguageRating.returnKeyType = UIReturnKeyDone;
//    _RiskFactor.returnKeyType = UIReturnKeyDone;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.ageMaxField resignFirstResponder];
    [self.ageMinField resignFirstResponder];
    [self.RiskFactor resignFirstResponder];
    [self.LanguageRating resignFirstResponder];
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
        t.Challenges = _Challenges;
    }
    else if ([segue.identifier isEqualToString:@"ToMainCreator"])
    {
        CreatorViewController *c = [segue destinationViewController];
        c.Challenges = _Challenges;
    }
    else
    {
        PickerPopUpViewController *p = [segue destinationViewController];
        p.options = _PickerPopUp.options;
        p.title = _PickerPopUp.title;
        p.list = _PickerPopUp.list;
        p.PopDailyChallenge = [[DailyChallenge alloc] init];
        p.PopDailyChallenge = _TheDailyChallenge;
        p.Challenges = _Challenges;
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

- (IBAction)setAgeMinField:(id)sender {
    _TheDailyChallenge.ageMin = _ageMinField.text;
}

- (IBAction)setAgeMaxField:(id)sender {
    _TheDailyChallenge.ageMax = _ageMaxField.text;
}

- (IBAction)setLanguage:(id)sender {
    _TheDailyChallenge.language = _LanguageRating.text.integerValue;
}

- (IBAction)setRiskFactor:(id)sender {
    _TheDailyChallenge.minimumRiskFactor = _RiskFactor.text.integerValue;
}

- (IBAction)doneAddingChallenges:(id)sender {
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
