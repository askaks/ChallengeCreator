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
    
    if(_TaskFormDailyChallenge.tasks == nil)
    {
        _TaskFormDailyChallenge.tasks = [[NSMutableArray alloc]init];
        //_listOfTasks = [[NSMutableArray alloc] init];
    }
	// Do any additional setup after loading the view.
    _taskTitleTextView.returnKeyType = UIReturnKeyDone;
    _messageTextView.returnKeyType = UIReturnKeyDone;
    _taskPointsTextView.returnKeyType = UIReturnKeyDone;
    _titleToEditTextField.returnKeyType = UIReturnKeyDone;
    _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
    _taskTitleTextField.returnKeyType = UIReturnKeyDone;
    NSInteger taskCount = _TaskFormDailyChallenge.tasks.count;
    _taskTitleTextField.text = [NSString stringWithFormat:@"Task %d \n", (taskCount + 1) ];
    [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.taskTitleTextView resignFirstResponder];
    [self.messageTextView resignFirstResponder];
    [self.taskPointsTextView resignFirstResponder];
    [self.titleToEditTextField resignFirstResponder];
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
}

- (IBAction)reminderSwitchAction:(id)sender {
    if(_reminderSwitch.on)
    {
        _reminderMessageTextField.hidden = false;
        _reminderTimeTextField.hidden = false;
        _reminderMessageLabel.hidden = false;
        _reeminderTimeLabel.hidden = false;

        if([_reminderMessageTextField.text isEqual:@""])
        {
            _reminderMessageTextField.text = _messageTextView.text;
            _reminderTimeTextField.text = @"11";
        }
    }
    else
    {
        _reminderMessageTextField.hidden = true;
        _reminderTimeTextField.hidden = true;
        _reminderMessageLabel.hidden = true;
        _reeminderTimeLabel.hidden = true;
    }
}

- (IBAction)addTask:(id)sender {
    Task *task;
    if(![_messageTextView.text isEqual:@""]&& ![_taskPointsTextView.text isEqual:@""] && ![_taskTitleTextView.text isEqual:@""])
    {
        NSString * titleAdjusted = [ _taskTitleTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if(_reminderSwitch.on)
        {
            if(![_reminderMessageTextField.text isEqual:@""] && ![_reminderTimeTextField.text isEqual:@""])
            {
                task = [[Task alloc] initWithMessage:_messageTextView.text points:_taskPointsTextView.text.integerValue time:_reminderTimeTextField.text reminderMessage:_reminderMessageTextField.text taskTitle:_taskTitleTextField.text];
            }
        }
        else
        {
            task = [[Task alloc] initWithMessage:_messageTextView.text points:_taskPointsTextView.text.integerValue title:titleAdjusted];
        }

    }
    if (task != nil) {
        [_TaskFormDailyChallenge.tasks addObject:task];
        [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
        _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
        _TaskFormDailyChallenge.pointsWorth += task.points;
    }
    _taskTitleTextField.text = [NSString stringWithFormat:@"Task %lu \n", (unsigned long)_TaskFormDailyChallenge.tasks.count + 1];
}

- (NSString*)printTaskToScreen: (NSMutableArray *) taskList
{
    NSString *combinedStuff = [[NSString alloc] init];
        //_taskTitle.text = [NSString stringWithFormat:@"Task %lu \n \n", (unsigned long)_listOfTasks.count];
    NSInteger taskCount = _TaskFormDailyChallenge.tasks.count;
        _taskTitleTextField.text = [NSString stringWithFormat:@"Task %d \n \n", (taskCount + 1)];
    for(Task *t in taskList)
    {
        if(_reminderSwitch.on)
        {
            combinedStuff = [NSString stringWithFormat:@"%@    Title: %@\nMessage: %@ (%ld pts)    \n Remind at %@ o'clock \n with Message: %@\n", combinedStuff, t.title, t.message, (long)t.points, t.reminderTime, t.reminderMessage];
        }
        else
        {
        combinedStuff = [NSString stringWithFormat:@"%@    Title: %@\nMessage: %@ (%ld pts)    \n", combinedStuff, t.title, t.message, (long)t.points];
        }
    }
    return combinedStuff;
}

- (IBAction)editTask:(id)sender {

    Task *taskToChange = [[Task alloc] init];
    Task *newTask = [[Task alloc] init];
    //make sure the task to replace is not null
    if(_messageTextView.text != nil && _taskPointsTextView.text != nil && _taskTitleTextView.text != nil)
    {
        NSString * titleAdjusted = [ _titleToEditTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        newTask = [[Task alloc] initWithMessage:_messageTextView.text points:_taskPointsTextView.text.integerValue title:titleAdjusted];
    for(Task *t in _TaskFormDailyChallenge.tasks )
    {
        if([t.title caseInsensitiveCompare:titleAdjusted]== NSOrderedSame)
        {
            taskToChange = &(*t);
            break;
        }
    }
    }
    if (taskToChange != NULL) {
        _TaskFormDailyChallenge.pointsWorth -= taskToChange.points;
        taskToChange.title = newTask.title;
        taskToChange.message = newTask.message;
        taskToChange.points = newTask.points;
        _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
    }
    _TaskFormDailyChallenge.pointsWorth += newTask.points;
}


- (IBAction)done:(id)sender {
    
}
- (IBAction)removeTask:(id)sender {
    Task *taskToDelete = [[Task alloc] init];
    
    NSString * adjustedTitleToRemove = [ _titleToEditTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for(Task *t in _TaskFormDailyChallenge.tasks )
    {
        if([t.title caseInsensitiveCompare:adjustedTitleToRemove]== NSOrderedSame)
        {
            taskToDelete = &(*t);
            break;
        }
    }
    if(taskToDelete != NULL)
    {
        _TaskFormDailyChallenge.pointsWorth -= taskToDelete.points;
        [_TaskFormDailyChallenge.tasks removeObject:taskToDelete];
        _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
    }
}
@end
