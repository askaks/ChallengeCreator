//
//  CreatorTaskFormViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/8/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyChallenge.h"
#import "Task.h"
#import "CreatorOptionsViewController.h"

@class DailyChallenge;
@class Task;
@class CreatorOptionsViewController;

@interface CreatorTaskFormViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) DailyChallenge *TaskFormDailyChallenge;
@property (nonatomic, retain) NSMutableArray *listOfTasks;
@property (nonatomic, retain) Task *task;
@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextView *message;
@property (weak, nonatomic) IBOutlet UITextField *taskPoints;
@property (weak, nonatomic) IBOutlet UIButton *addTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *editTaskButton;
@property (weak, nonatomic) IBOutlet UITextField *titleToEdit;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)addTask:(id)sender;
- (IBAction)editTask:(id)sender;
- (IBAction)done:(id)sender;
- (NSString *)printTaskToScreen: (NSMutableArray *) taskList;
@property (weak, nonatomic) IBOutlet UIButton *removeTaskButton;
- (IBAction)removeTask:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *infoBox;

@end
