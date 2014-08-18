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
    self.myTaskScrollView.contentSize = CGSizeMake(320, 1000);
	// Do any additional setup after loading the view.
    _taskTitle.returnKeyType = UIReturnKeyDone;
    _message.returnKeyType = UIReturnKeyDone;
    _taskPoints.returnKeyType = UIReturnKeyDone;
    _titleToEdit.returnKeyType = UIReturnKeyDone;
    _infoBox.text = [self printTaskToScreen:_listOfTasks];
    _taskTitleTextField.returnKeyType = UIReturnKeyDone;
    
    _taskTitle.text = [NSString stringWithFormat:@"Task %lu \n", (unsigned long)_listOfTasks.count];
    _taskTitleTextField.text = _taskTitle.text;
    
    //[printTaskToScreen _listOfTasks];
    //_infoBox.text = [NSString stringWithFormat:@"Tasks: %@", pr];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.taskTitle resignFirstResponder];
    [self.message resignFirstResponder];
   [self.taskPoints resignFirstResponder];
    [self.titleToEdit resignFirstResponder];
    [self.taskTitleTextField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return YES;
}


-(BOOL):(UITextField *)textField
{
	[textField resignFirstResponder];
	
	return YES;
}

- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatorOptionsViewController *optionsController = [segue destinationViewController];
    optionsController.TheDailyChallenge = [[DailyChallenge alloc] init];
    optionsController.TheDailyChallenge = _TaskFormDailyChallenge;
    //optionsController.Challenges = _Challenges;
}

- (IBAction)addTask:(id)sender {
    Task *task;
    if(_message.text != nil && _taskPoints.text != nil && _taskTitle.text != nil)
    {
        task = [[Task alloc] initWithMessage:_message.text points:_taskPoints.text.integerValue title:_taskTitle.text];
    }
    [_listOfTasks addObject:task];
    [self printTaskToScreen:_listOfTasks];
    //NSString * combinedStuff = [];
    //NSString * combinedStuff = [listOfTasks componentsJoinedByString:@"  "];
    //InfoBox.text = combinedStuff;
    _infoBox.text = [self printTaskToScreen:_listOfTasks];
    _TaskFormDailyChallenge.pointsWorth += task.points;
    
}

- (NSString*)printTaskToScreen: (NSMutableArray *) taskList
{
    NSString *combinedStuff = [[NSString alloc] init];
        _taskTitle.text = [NSString stringWithFormat:@"Task %lu \n \n", (unsigned long)_listOfTasks.count];
        _taskTitleTextField.text = _taskTitle.text;
    for(Task *t in taskList)
    {
        combinedStuff = [NSString stringWithFormat:@"%@    Title: %@ message: %@ (%d pts)    \n", combinedStuff, t.title, t.message, t.points];
    }
    return combinedStuff;
}

- (IBAction)editTask:(id)sender {

    Task *taskToChange = [[Task alloc] init];
    Task *newTask = [[Task alloc] init];
    if(_message.text != nil && _taskPoints.text != nil && _taskTitle.text != nil)
    {
        newTask = [[Task alloc] initWithMessage:_message.text points:_taskPoints.text.integerValue title:_taskTitle.text];
    }
    for(Task *t in _listOfTasks )
    {
        if([t.title isEqualToString:newTask.title])
        {
            taskToChange = &(*t);
            break;
        }
    }
    if (taskToChange != NULL) {
        _TaskFormDailyChallenge.pointsWorth -= taskToChange.points;
        taskToChange.title = newTask.title;
        taskToChange.message = newTask.message;
        taskToChange.points = newTask.points;
        _infoBox.text = [self printTaskToScreen:_listOfTasks];
    }

    
;
    _TaskFormDailyChallenge.pointsWorth += newTask.points;
    
//    [listOfTasks replaceObjectAtIndex:<#(NSUInteger)#> withObject:task];
//    [self printTaskToScreen:listOfTasks];
}


- (IBAction)done:(id)sender {
    
}
- (IBAction)removeTask:(id)sender {
    Task *taskToDelete = [[Task alloc] init];
//    Task *newTask = [[Task alloc] init];
//    if(_message.text != nil && _taskPoints.text != nil && _taskTitle.text != nil)
//    {
//        newTask = [[Task alloc] initWithMessage:_message.text points:_taskPoints.text.integerValue title:_taskTitle.text];
//    }
    for(Task *t in _listOfTasks )
    {
        if([t.title isEqualToString: (NSString *)_titleToEdit.text])
        {
            taskToDelete = &(*t);
            break;
        }
    }
    if(taskToDelete != NULL)
    {
        _TaskFormDailyChallenge.pointsWorth -= taskToDelete.points;
        [_listOfTasks removeObject:taskToDelete];
        _infoBox.text = [self printTaskToScreen:_listOfTasks];
    }
}
@end
