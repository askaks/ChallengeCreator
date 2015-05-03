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
    _taskTitleTextField.text = [NSString stringWithFormat:@"Task %ld \n", (taskCount + 1) ];
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
    if(![_messageTextView.text isEqual:@""]&& ![_taskPointsTextView.text isEqual:@""] && ![_taskTitleTextField.text isEqual:@""])
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
        //_TaskFormDailyChallenge.pointsWorth += task.points;
    }
    _taskTitleTextField.text = [NSString stringWithFormat:@"Task %lu \n", (unsigned long)_TaskFormDailyChallenge.tasks.count + 1];
}

- (NSString*)printTaskToScreen: (NSMutableArray *) taskList
{
    NSString *combinedStuff = [[NSString alloc] init];
        //_taskTitle.text = [NSString stringWithFormat:@"Task %lu \n \n", (unsigned long)_listOfTasks.count];
    NSInteger taskCount = _TaskFormDailyChallenge.tasks.count;
        _taskTitleTextField.text = [NSString stringWithFormat:@"Task %ld \n \n", (taskCount + 1)];
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
        //_TaskFormDailyChallenge.pointsWorth -= taskToChange.points;
        taskToChange.title = newTask.title;
        taskToChange.message = newTask.message;
        taskToChange.points = newTask.points;
        _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
    }
    //_TaskFormDailyChallenge.pointsWorth += newTask.points;
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
        //_TaskFormDailyChallenge.pointsWorth -= taskToDelete.points;
        [_TaskFormDailyChallenge.tasks removeObject:taskToDelete];
        _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
    }
}

- (IBAction)editedAll:(id)sender {
    _jsonTextView.hidden = false;
    _createJSONButton.hidden = false;
    _editedAllButton.hidden = true;
    if(_TaskFormDailyChallenge.tasks.count > 0)
    {
        //Display in JSON form
        //NSMutableArray *thisChallenge = [[NSMutableArray alloc] init];
        NSError *error = nil;
        NSDictionary *allCourses = [[NSDictionary alloc] init];
        //NSArray *thisChallenge = allCourses[@"This Challenge"];
        NSMutableArray *arrayOfTaskDicionaries = [[NSMutableArray alloc] init];
        for (Task *t in _TaskFormDailyChallenge.tasks)
        {
            NSString *jTitle = t.title;
            NSString *jPoints = [NSString stringWithFormat:@"%ld", (long)t.points];
            NSString *jReminderTime = t.reminderTime;
            NSString *jReminderMessage = t.reminderMessage;
            NSString *jMessage = t.message;
            NSArray *keys, *obs;
            if(jReminderTime != nil && jReminderMessage != nil)
            {
                keys=[[NSArray alloc]initWithObjects:@"title", @"points",@"reminderTime", @"reminderMessage", @"message", nil];
                obs=[[NSArray alloc]initWithObjects:jTitle, jPoints, jReminderMessage, jReminderTime, jMessage, nil];
            }
            else
            {
                keys=[[NSArray alloc]initWithObjects:@"title", @"points", @"message", nil];
                obs= [[NSArray alloc] initWithObjects:jTitle, jPoints, jMessage, nil];
            }
            //Each task is a dictionary
            NSDictionary *dict=[NSDictionary dictionaryWithObjects:obs forKeys:keys];
            //NSDictionary *tasktionary=[NSDictionary dictionaryWithObjects:obs forKeys:keys];
            [arrayOfTaskDicionaries addObject:dict];
        }
      
        allCourses = [NSDictionary dictionaryWithObject:arrayOfTaskDicionaries forKey:@"This Challenge"];
            //
            NSData *jsonData=[NSJSONSerialization dataWithJSONObject:allCourses options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jasonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        self.jsonTextView.text = jasonString;
    }
}

- (void)logTask:(NSDictionary *)tasklets {
    NSLog(@"----");
    NSLog(@"Title: %@", tasklets[@"title"] );
    NSLog(@"Speaker: %@", tasklets[@"points"] );
    NSLog(@"Time: %@", tasklets[@"reminderTime"] );
    NSLog(@"Room: %@", tasklets[@"reminderMessage"] );
    NSLog(@"Details: %@", tasklets[@"message"] );
    NSLog(@"----");
}

- (IBAction)createJSON:(id)sender {
    _jsonTextView.hidden = true;
    _createJSONButton.hidden = true;
    _editedAllButton.hidden = false;
    NSData *returnedData = [_jsonTextView.text dataUsingEncoding:NSStringEncodingConversionAllowLossy];
    NSError *error = nil;

    id object = [NSJSONSerialization
                 JSONObjectWithData:returnedData
                 options:0
                 error:&error];

    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        //Clear existing Tasks in DailyChallenge
        [self.TaskFormDailyChallenge.tasks removeAllObjects];
        //self.TaskFormDailyChallenge.pointsWorth = 0;
        NSDictionary *allCoursesDictionary = object;
        NSArray *thisChallengeArray = allCoursesDictionary[@"This Challenge"];
        Task *newJTask;
        for ( NSDictionary *tasklets in thisChallengeArray )
        {
            [self logTask:tasklets];
            
            NSString *jTitle = tasklets[@"title"];
            NSString *jPoints = tasklets[@"points"];
            NSString *jReminderTime = tasklets[@"reminderTime"];
            NSString *jReminderMessage = tasklets[@"reminderMessage"];
            NSString *jMessage = tasklets[@"message"];
            if(jReminderMessage != nil && jReminderTime != nil)
            {
                newJTask = [[Task alloc] initWithMessage:jMessage points:jPoints.integerValue time:jReminderTime reminderMessage:jReminderMessage taskTitle:jTitle];
            }
            else
            {
                newJTask = [[Task alloc] initWithMessage:jMessage points:jPoints.integerValue title:jTitle];
            }
            if (newJTask != nil) {
                [_TaskFormDailyChallenge.tasks addObject:newJTask];
                [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
                _infoBoxTextField.text = [self printTaskToScreen:_TaskFormDailyChallenge.tasks];
                //_TaskFormDailyChallenge.pointsWorth += newJTask.points;
            }
        }
    }
    
//    Read more: http://www.intertech.com/Blog/basic-json-parsing-in-ios/#ixzz3J5MCDgvf
//    Follow us: @IntertechInc on Twitter | Intertech on Facebook
    

}
@end
