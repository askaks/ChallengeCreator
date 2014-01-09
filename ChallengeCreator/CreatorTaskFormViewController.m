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

- (IBAction)addTask:(id)sender {

    if(message != nil && taskPoints.text != nil)
    {
        task = [[Task alloc] initWithMessage:message.text points:taskPoints.text.integerValue];
    }
    [listOfTasks addObject:task];
    NSString * combinedStuff = [listOfTasks componentsJoinedByString:@"  "];
    //InfoBox.text = combinedStuff;
    
}
//- (void)printTaskToScreen: (NSMutableArray *) taskList
//{
//    for(Task *t in )
//}

- (IBAction)editTask:(id)sender {
}


- (IBAction)done:(id)sender {
}
@end
