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
    combinedStuff = [NSString stringWithFormat:@"Challenge Title: %@ \n for ages %d@ - %d@ \n lang: %d and riskFactor %d \n Looking For: %@ \n School: %@ \n Work: %@ \n Relationship: %@ \n Kids: %@ \n Pets: %@ \n", _TheDailyChallenge.title, _TheDailyChallenge.ageMin, _TheDailyChallenge.ageMax, _TheDailyChallenge.language, _TheDailyChallenge.minimumRiskFactor, _LookingInfoBox.text, _SchoolInfoBox.text, _WorkInfoBox.text, _LoveInfoBox.text, _ChildInfoBox.text, _PetInfoBox.text];
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
        
        if  (_TheDailyChallenge.relationshipHappyExcludes != nil)
        {
            _relalationshipSatisfactionInfoBox.text = [_TheDailyChallenge.relationshipHappyExcludes componentsJoinedByString:@"  "];
        }
        if  (_TheDailyChallenge.schoolHappyExcludes != nil)
        {
            _schoolSatisfactionInfoBox.text = [_TheDailyChallenge.schoolHappyExcludes componentsJoinedByString:@"  "];
        }
        if  (_TheDailyChallenge.workHappyExcludes != nil)
        {
            _workSatisfactionInfoBox.text = [_TheDailyChallenge.workHappyExcludes componentsJoinedByString:@"  "];
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
    if(_TheDailyChallenge != nil && _TheDailyChallenge.tasks != nil && _TheDailyChallenge.tasks.count >= 1 )
    {
        bool validChallenges = [self areValidChallenges];
        if(validChallenges)
        {
            
            PFObject *dailyChallenge = [PFObject objectWithClassName:@"Challenges"];
            dailyChallenge[@"title"] = _TheDailyChallenge.title;
            dailyChallenge[@"points"] = [NSNumber numberWithInteger:_TheDailyChallenge.pointsWorth];
            dailyChallenge[@"ageMin"] = [NSNumber numberWithInteger:_TheDailyChallenge.ageMin];
            dailyChallenge[@"ageMax"] = [NSNumber numberWithInteger:_TheDailyChallenge.ageMax];
            dailyChallenge[@"languageRating"] =[NSNumber numberWithInteger:_TheDailyChallenge.language];
            dailyChallenge[@"riskFactor"] = [NSNumber numberWithInteger:_TheDailyChallenge.minimumRiskFactor];
            dailyChallenge[@"forSex"] = [_TheDailyChallenge.genderExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"seekingWho"] = [_TheDailyChallenge.interestedInExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"eduIncludes"] = [_TheDailyChallenge.schoolLevelExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"relationshipIncludes"] = [_TheDailyChallenge.relationshipLevelExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"incomeIncludes"] = [_TheDailyChallenge.workLevelExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"childIncludes"] = [_TheDailyChallenge.kidsExclude componentsJoinedByString:@" | "];
            dailyChallenge[@"petIncludes"] = [_TheDailyChallenge.petsExclude componentsJoinedByString:@" | "];
            dailyChallenge[@"happyWithLove"] = [_TheDailyChallenge.relationshipHappyExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"happyWithSchool"] = [_TheDailyChallenge.schoolHappyExcludes componentsJoinedByString:@" | "];
            dailyChallenge[@"happyWithWork"] = [_TheDailyChallenge.workHappyExcludes componentsJoinedByString:@" | "];
            
            //Now that dailyChallenge is added to Parse.Challenges
            //we need its objectId to put its tasks into Parse.Tasks
            [dailyChallenge saveEventually:^(BOOL succeeded, NSError *error) {
                NSInteger taskCount = 0;
                for(Task *task in _TheDailyChallenge.tasks)
                {
                    PFObject *taskObj = [PFObject objectWithClassName:@"Tasks"];
                    taskObj[@"action"] = task.message;
                    taskObj[@"points"] = [NSNumber numberWithInteger:task.points];
                    taskObj[@"taskNumber"] = [NSNumber numberWithInteger:taskCount];
                    taskCount++;
                    [taskObj saveEventually:^(BOOL succeeded, NSError *error) {
                        PFRelation *relationChallengeToTask = [taskObj relationforKey:@"challenge"];
                        [relationChallengeToTask addObject:dailyChallenge];
                    }];
                }
            }];
            _cancelAddChallenge.hidden = true;
            _createChallengeButton.hidden = true;
            _challengePreviewScreen.hidden = true;
            _challengeTextDisplay.hidden = true;
        }
        else
        {
            _challengeTextDisplay.text = @"INVALID CHALLENGE";
        }
    }

}


- (BOOL)areValidChallenges{

    BOOL valid = true;
    
    NSString *a = [_TheDailyChallenge.genderExcludes componentsJoinedByString:@""];
    NSString *b = [_TheDailyChallenge.interestedInExcludes componentsJoinedByString:@""];
    NSString *c = [_TheDailyChallenge.schoolLevelExcludes componentsJoinedByString:@""];
    NSString *d = [_TheDailyChallenge.relationshipLevelExcludes componentsJoinedByString:@""];
    NSString *e = [_TheDailyChallenge.workLevelExcludes componentsJoinedByString:@""];
    NSString *f = [_TheDailyChallenge.kidsExclude componentsJoinedByString:@""];
    NSString *g = [_TheDailyChallenge.petsExclude componentsJoinedByString:@""];
    NSString *h = [_TheDailyChallenge.relationshipHappyExcludes componentsJoinedByString:@""];
    NSString *i = [_TheDailyChallenge.schoolHappyExcludes componentsJoinedByString:@""];
    NSString *j = [_TheDailyChallenge.workHappyExcludes componentsJoinedByString:@""];

    if([_TheDailyChallenge.title isEqualToString:@""])
    {
        return false;
    }
    else if(_TheDailyChallenge.pointsWorth <= 0)
    {
        return false;
    }
    else if(_TheDailyChallenge.ageMin <= 0)
    {
        return false;
    }
    else if(_TheDailyChallenge.ageMax <= 0 || _TheDailyChallenge.ageMax > 1001)
    {
        return false;
    }
    else if(_TheDailyChallenge.language <= 0)
    {
        return false;
    }
    else if(_TheDailyChallenge.minimumRiskFactor <= 0)
    {
        return false;
    }
    else if([a isEqualToString:@""])
    {
        return false;
    }
    else if([b isEqualToString:@""])
    {
        return false;
    }
    else if([c isEqualToString:@""])
    {
        return false;
    }
    else if([d isEqualToString:@""])
    {
        return false;
    }
    else if([e isEqualToString:@""])
    {
        return false;
    }
    else if([f isEqualToString:@""])
    {
        return false;
    }
    else if([g isEqualToString:@""])
    {
        return false;
    }
    else if([h isEqualToString:@""])
    {
        return false;
    }
    else if([i isEqualToString:@""])
    {
        return false;
    }
    else if([j isEqualToString:@""])
    {
        return false;
    }



    return valid;
}

- (IBAction)clearChallenge:(id)sender {
    _TheDailyChallenge = [[DailyChallenge alloc] init];
    _ageMinField.text = @"";
    _ageMaxField.text = @"";
    _RiskFactor.text = @"";
    _LanguageRating.text =@"";
    _ChallengeTitle.text =@"";
}

- (IBAction)FilterPartners:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    _PickerPopUp.title = @"Looking For";
    PFQuery *partnerQuery = [PFQuery queryWithClassName:@"Options"];
    
    [partnerQuery selectKeys:@[@"partnerOptions"]];
    [partnerQuery whereKey:@"partnerOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [partnerQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *partnerOps = obj[@"partnerOptions"];
            [ _PickerPopUp.options addObject:(partnerOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Partner objects not found");
    }
    
    NSMutableArray *list = _TheDailyChallenge.interestedInExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterLove:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Relationship Status";
    
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
         else
         {
             // Log details of the failure
             NSLog(@"Error: Relationship objects not found");
         }
    NSMutableArray *list = _TheDailyChallenge.relationshipLevelExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterSchool:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"School";
    
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *educationQuery = [PFQuery queryWithClassName:@"Options"];
    
    [educationQuery selectKeys:@[@"educationOptions"]];
    [educationQuery whereKey:@"educationOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [educationQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *eduOps = obj[@"educationOptions"];
            [ _PickerPopUp.options addObject:(eduOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Education objects not found");
    }
    NSMutableArray *list = _TheDailyChallenge.schoolLevelExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterWork:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Work";
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *incomeQuery = [PFQuery queryWithClassName:@"Options"];
    
    [incomeQuery selectKeys:@[@"incomeOptions"]];
    [incomeQuery whereKey:@"incomeOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [incomeQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *incomeOps = obj[@"incomeOptions"];
            [ _PickerPopUp.options addObject:(incomeOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Income objects not found");
    }

    NSMutableArray *list = _TheDailyChallenge.workLevelExcludes;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterChildren:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Children";
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *childQuery = [PFQuery queryWithClassName:@"Options"];
    
    [childQuery selectKeys:@[@"childOptions"]];
    [childQuery whereKey:@"childOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [childQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *childOps = obj[@"childOptions"];
            [ _PickerPopUp.options addObject:(childOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Children objects not found");
    }

    NSMutableArray *list = _TheDailyChallenge.kidsExclude;
    _PickerPopUp.list = &(*list);
}
- (IBAction)FilterPets:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Pets";
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *petQuery = [PFQuery queryWithClassName:@"Options"];
    
    [petQuery selectKeys:@[@"petOptions"]];
    [petQuery whereKey:@"petOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [petQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *petOps = obj[@"petOptions"];
            [ _PickerPopUp.options addObject:(petOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Pet objects not found");
    }
    NSMutableArray *list = _TheDailyChallenge.petsExclude;
    _PickerPopUp.list = &(*list);
}

- (IBAction)setMyAgeMinField:(id)sender {
    _TheDailyChallenge.ageMin = _ageMinField.text.integerValue;
}

- (IBAction)setMyAgeMaxField:(id)sender {
    _TheDailyChallenge.ageMax = _ageMaxField.text.integerValue;
}

- (IBAction)setLanguage:(id)sender {
    _TheDailyChallenge.language = _LanguageRating.text.integerValue;
}

- (IBAction)setMyRiskFactor:(id)sender {
    _TheDailyChallenge.minimumRiskFactor = _RiskFactor.text.integerValue;
}

- (IBAction)filterSexes:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Sex";
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *sexQuery = [PFQuery queryWithClassName:@"Options"];
    
    [sexQuery selectKeys:@[@"sexOptions"]];
    [sexQuery whereKey:@"sexOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [sexQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *sexOps = obj[@"sexOptions"];
            [ _PickerPopUp.options addObject:(sexOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: No sex objects not found");
    }
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
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Education Satisfaction";
    
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *schoolQuery = [PFQuery queryWithClassName:@"Options"];
    
    [schoolQuery selectKeys:@[@"schoolSatisfactionOptions"]];
    [schoolQuery whereKey:@"schoolSatisfactionOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [schoolQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *schoolOps = obj[@"schoolSatisfactionOptions"];
            [ _PickerPopUp.options addObject:(schoolOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: School Satisfaction objects not found");
    }
    NSMutableArray *list = _TheDailyChallenge.schoolHappyExcludes;
    _PickerPopUp.list = &(*list);

}

- (IBAction)ExcludeWorkHappy:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Work Satisfaction";
    
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *workQuery = [PFQuery queryWithClassName:@"Options"];
    
    [workQuery selectKeys:@[@"workSatisfactionOptions"]];
    [workQuery whereKey:@"workSatisfactionOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [workQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *workOps = obj[@"workSatisfactionOptions"];
            [ _PickerPopUp.options addObject:(workOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Work Satisfaction objects not found");
    }
    NSMutableArray *list = _TheDailyChallenge.workHappyExcludes;
    _PickerPopUp.list = &(*list);
}

- (IBAction)ExcludeLoveHappy:(id)sender {
    _PickerPopUp = [[PickerPopUpViewController alloc] init];
    _PickerPopUp.title = @"Love Satisfaction";
    
    _PickerPopUp.options = [[NSMutableArray alloc] init ];
    PFQuery *loveQuery = [PFQuery queryWithClassName:@"Options"];
    
    [loveQuery selectKeys:@[@"loveSatisfactionOptions"]];
    [loveQuery whereKey:@"loveSatisfactionOptions" notEqualTo:@"N/A"];
    //[loveQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    NSArray *objects = [[NSArray alloc] init];
    objects = [loveQuery findObjects];
    if (objects != NULL)
    {
        for (PFObject *obj in objects)
        {
            PFObject *loveOps = obj[@"loveSatisfactionOptions"];
            [ _PickerPopUp.options addObject:(loveOps)];
        }
    }
    else
    {
        // Log details of the failure
        NSLog(@"Error: Love Satisfaction objects not found");
    }
    NSMutableArray *list = _TheDailyChallenge.relationshipHappyExcludes;
    _PickerPopUp.list = &(*list);
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
