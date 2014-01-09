//
//  CreatorTaskFormViewController.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/8/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "CreatorTaskFormViewController.h"

@interface CreatorTaskFormViewController ()

@end

@implementation CreatorTaskFormViewController

@synthesize TaskFormDailyChallenge;
@synthesize listOfTasks;
@synthesize task;
@synthesize taskTitle;
@synthesize message;
@synthesize taskPoints;
@synthesize titleToEdit;


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
    taskTitle.returnKeyType = UIReturnKeyDone;
    message.returnKeyType = UIReturnKeyDone;
    taskPoints.returnKeyType = UIReturnKeyDone;
    titleToEdit.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatorOptionsViewController *optionsController = [segue destinationViewController];
    optionsController.TheDailyChallenge = [[DailyChallenge alloc] init];
    optionsController.TheDailyChallenge = TaskFormDailyChallenge;
}

- (IBAction)addTask:(id)sender {

    if(message.text != nil && taskPoints.text != nil && taskTitle.text != nil)
    {
        task = [[Task alloc] initWithMessage:message.text points:taskPoints.text.integerValue title:taskTitle.text];
    }
    [listOfTasks addObject:task];
    [self printTaskToScreen:listOfTasks];
    //NSString * combinedStuff = [];
    //NSString * combinedStuff = [listOfTasks componentsJoinedByString:@"  "];
    //InfoBox.text = combinedStuff;
    
}
- (void)printTaskToScreen: (NSMutableArray *) taskList
{
    NSString *combinedStuff;
    for(Task *t in taskList)
    {
        //combinedStuff = t.title + t.message;
    }
}

- (IBAction)editTask:(id)sender {

    if(message.text != nil && taskPoints.text != nil && taskTitle.text != nil)
    {
        task = [[Task alloc] initWithMessage:message.text points:taskPoints.text.integerValue title:taskTitle.text];
    }
    listOfTasks inde
    [listOfTasks replaceObjectAtIndex:<#(NSUInteger)#> withObject:task];
    [self printTaskToScreen:listOfTasks];
}   


- (IBAction)done:(id)sender {
    
}
@end
