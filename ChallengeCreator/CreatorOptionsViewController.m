//
//  CreatorOptionsViewController.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "CreatorOptionsViewController.h"
#import <Parse/Parse.h>
@interface CreatorOptionsViewController ()

@end

@implementation CreatorOptionsViewController


//- (NSString *)challengesPath
//{
//    NSString *docDir =
//	[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//										 NSUserDomainMask, YES) objectAtIndex: 0];
//	return [docDir stringByAppendingPathComponent: @"Challenge.dat"];
//}
//
//- (void)archiveChallenges:(NSMutableArray *)array
//{
//    NSString *filePath = [self challengesPath];
//    
//	if ([array count] > 0)
//    {
//        NSError *error = nil;
//        NSDictionary *attrib;
//        
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        
//        //
//        // check if file already exist
//        //
//        BOOL exist = [fileManager fileExistsAtPath:filePath];
//        BOOL success = YES;
//        if (YES == exist)
//        {
//            // UNLOCK THE FILE
//            attrib = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
//                                                 forKey:NSFileImmutable];
//            
//            success = [fileManager setAttributes:attrib
//                                    ofItemAtPath:filePath
//                                           error:&error];
//        }
//        if (YES == success)
//        {
//            // SAVE THE FILE
//            [NSKeyedArchiver archiveRootObject:array
//                                        toFile:filePath];
//            
//            // LOCK IT BACK
//            attrib = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES]
//                                                 forKey:NSFileImmutable];
//            
//            success = [fileManager setAttributes:attrib
//                                    ofItemAtPath:filePath
//                                           error:&error];
//            
//            if (NO == success) {
//                NSLog(@"Error: %@",[error localizedDescription]);
//            }
//        }
//        else {
//            NSLog(@"Could not UNLOCK the file.");
//        }
//	}
//	else {
//		
//		UIAlertView *alertView;
//		alertView = [[UIAlertView alloc]
//					 initWithTitle: @"EMPTY OBJECT"
//					 message: @"WARNING: Nothing was saved."
//					 delegate: nil
//					 cancelButtonTitle:@"OK"
//					 otherButtonTitles:nil];
//		[alertView show];
//	}
//}
//
//- (NSMutableArray *)unarchiveChallenges
//{
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSString *filePath = [self challengesPath];
//    //
//    // check if file already exist
//    //
//    BOOL exist = [fileManager fileExistsAtPath:filePath];
//    if (NO == exist)
//    {
//        UIAlertView *alertView;
//        alertView = [[UIAlertView alloc]
//                     initWithTitle: @"FILE NOT FOUND"
//                     message: @"WARNING: nothing was unarchived."
//                     delegate: nil
//                     cancelButtonTitle:@"OK"
//                     otherButtonTitles:nil];
//        [alertView show];
//        
//        return nil;
//    }
//    
//	NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//    
//	return array;
//}

- (IBAction)previewAndConfirm:(id)sender {
    _cancelAddChallenge.hidden = false;
    _createChallengeButton.hidden = false;
    _challengePreviewScreen.hidden = false;
    _challengeTextDisplay.hidden = false;
    

    
    NSString *combinedStuff = [[NSString alloc] init];
    combinedStuff = [NSString stringWithFormat:@"Challenge Title: %@ \n for ages %@ - %@ \n lang: %d and riskFactor %d \n Looking For: %@ \n School: %@ \n Work: %@ \n Relationship: %@ \n Kids: %@ \n Pets: %@ \n", _TheDailyChallenge.title, _TheDailyChallenge.ageMin, _TheDailyChallenge.ageMax, _TheDailyChallenge.language, _TheDailyChallenge.minimumRiskFactor, _LookingInfoBox.text, _SchoolInfoBox.text, _WorkInfoBox.text, _LoveInfoBox.text, _ChildInfoBox.text, _PetInfoBox.text];
    for(Task *t in _TheDailyChallenge.tasks)
    {
        combinedStuff = [NSString stringWithFormat:@"%@    Title: %@ message: %@ (%d pts)    \n", combinedStuff, t.title, t.message, t.points];
    }
    
    _challengeTextDisplay.text = combinedStuff;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
	[textField resignFirstResponder];
    
	return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

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
        
        if (_TheDailyChallenge.interestedInExcludes != nil)
        {
            _LookingInfoBox.text = [_TheDailyChallenge.interestedInExcludes componentsJoinedByString:@"  "];
        }
        if (_TheDailyChallenge.schoolLevelExcludes != nil)
        {
            _SchoolInfoBox.text = [_TheDailyChallenge.schoolLevelExcludes componentsJoinedByString:@"  "];
        }
        if (_TheDailyChallenge.workLevelExcludes != nil)
        {
            _WorkInfoBox.text = [_TheDailyChallenge.workLevelExcludes componentsJoinedByString:@"  "];
        }
        if (_TheDailyChallenge.relationshipLevelExcludes != nil)
        {
            _LoveInfoBox.text = [_TheDailyChallenge.relationshipLevelExcludes componentsJoinedByString:@"  "];
        }
        if (_TheDailyChallenge.kidsExclude != nil)
        {
            _ChildInfoBox.text = [_TheDailyChallenge.kidsExclude componentsJoinedByString:@"  "];
        }
        if (_TheDailyChallenge.petsExclude != nil)
        {
            _PetInfoBox.text = [_TheDailyChallenge.petsExclude componentsJoinedByString:@"  "];
        }
        if  (_TheDailyChallenge.genderExcludes != nil)
        {
            _genderInfoBox.text = [_TheDailyChallenge.genderExcludes componentsJoinedByString:@"  "];
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
        //t.Challenges = _Challenges;
    }
    else if ([segue.identifier isEqualToString:@"ToMainCreator"])
    {
        CreatorViewController *c = [segue destinationViewController];
        //c.Challenges = _Challenges;
    }
    else
    {
        PickerPopUpViewController *p = [segue destinationViewController];
        p.options = _PickerPopUp.options;
        p.title = _PickerPopUp.title;
        p.list = _PickerPopUp.list;
        p.PopDailyChallenge = [[DailyChallenge alloc] init];
        p.PopDailyChallenge = _TheDailyChallenge;
        //p.Challenges = _Challenges;
    }
}
///XML VERSION
//- (IBAction)CreateChallenge:(id)sender {
//    if(_TheDailyChallenge != nil && _TheDailyChallenge.tasks != nil && _TheDailyChallenge.tasks.count >= 1)
//    {
//        [_Challenges addObject:_TheDailyChallenge];
//    }
//    _cancelAddChallenge.hidden = true;
//    _createChallengeButton.hidden = true;
//    _challengePreviewScreen.hidden = true;
//    _challengeTextDisplay.hidden = true;
//}

//PARSE VERSION: this is where one challenge at a time will be added to Parse
- (IBAction)CreateChallenge:(id)sender {
    if(_TheDailyChallenge != nil && _TheDailyChallenge.tasks != nil && _TheDailyChallenge.tasks.count >= 1)
    {
 
    }
    _cancelAddChallenge.hidden = true;
    _createChallengeButton.hidden = true;
    _challengePreviewScreen.hidden = true;
    _challengeTextDisplay.hidden = true;
}

- (IBAction)clearChallenge:(id)sender {
    _TheDailyChallenge = [[DailyChallenge alloc] init];
    _ageMinField.text = @"";
    _ageMaxField.text = @"";
    _RiskFactor.text = @"";
    _LanguageRating.text =@"";
    _ChallengeTitle.text =@"";
}

- (IBAction)FilterLookingFor:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Looking For";
    _PickerPopUp.options = [[NSMutableArray alloc] initWithObjects:@"Female",@"Male",nil];
    NSMutableArray *list = _TheDailyChallenge.interestedInExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterLove:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Relationship Status";
    
    
    [PFUser currentUser][@"name"] = @"Creator";
    [[PFUser currentUser] saveInBackground];
    
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *loveQuery = [PFQuery queryWithClassName:@"Options"];
    
    [loveQuery selectKeys:@[@"loveOptions"]];
    [loveQuery whereKey:@"loveOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [loveQuery findObjects];
         if (objects != NULL)
         {
             for (PFObject *obj in objects)
             {
                 PFObject *loveOps = obj[@"loveOptions"];
                 [ _PickerPopUp.options addObject:(loveOps)];
             }
         }
         // The find succeeded. The first 100 objects are available in object
         else
         {
             // Log details of the failure
             NSLog(@"Error: Relationship objects not found");
         }
    
//    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"Single",@"Dating", @"Committed", @"Married",@"Divorced", @"Widowed", @"Not Looking",nil];
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

- (IBAction)setMyAgeMinField:(id)sender {
    _TheDailyChallenge.ageMin = _ageMinField.text;
}

- (IBAction)setMyAgeMaxField:(id)sender {
    _TheDailyChallenge.ageMax = _ageMaxField.text;
}

- (IBAction)setLanguage:(id)sender {
    _TheDailyChallenge.language = _LanguageRating.text.integerValue;
}

- (IBAction)setMyRiskFactor:(id)sender {
    _TheDailyChallenge.minimumRiskFactor = _RiskFactor.text.integerValue;
}

- (IBAction)filterGenderExclusions:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Genders";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"female",@"male",nil];
    NSMutableArray *list = _TheDailyChallenge.genderExcludes;
    _PickerPopUp.list = &(*list);
}

- (IBAction)doneAddingChallenges:(id)sender {
}

- (IBAction)setMyChallengeTitle:(id)sender {
    _TheDailyChallenge.title = _ChallengeTitle.text;
    
}

- (IBAction)addTask:(id)sender {
    _TaskForm = [[CreatorTaskFormViewController alloc] init];
    NSMutableArray *list = _TheDailyChallenge.tasks;
    _TaskForm.listOfTasks = &(*list);
}

- (IBAction)ExcludeSchoolHappy:(id)sender {
    if(_SchoolHappySwitch.on == true)
    {
        _TheDailyChallenge.schoolHappyExcludes = [[NSString alloc] initWithFormat:@"true"];
    }
    else
    {
        _TheDailyChallenge.schoolHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
    }

}

- (IBAction)ExcludeWorkHappy:(id)sender {
    if(_WorkHappySwitch.on == true)
    {
        _TheDailyChallenge.workHappyExcludes = [[NSString alloc] initWithFormat:@"true"];
    }
    else
    {
        _TheDailyChallenge.workHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
    }
}

- (IBAction)ExcludeLoveHappy:(id)sender {
    if(_LoveHappySwitch.on == true)
    {
        _TheDailyChallenge.relationshipHappyExcludes = [[NSString alloc] initWithFormat:@"true"];
    }
    else
    {
        _TheDailyChallenge.relationshipHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
    }
}

- (IBAction)ExcludeFemales:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Genders";
    _PickerPopUp.options = [[NSArray alloc] initWithObjects:@"female",@"male",nil];
    NSMutableArray *list = _TheDailyChallenge.femaleExcl;
    _PickerPopUp.list = &(*list);

}
- (IBAction)cancelAddingChallenge:(id)sender {
    _cancelAddChallenge.hidden = true;
    _createChallengeButton.hidden = true;
    _challengePreviewScreen.hidden = true;
    _challengeTextDisplay.hidden = true;
}
@end
