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

//@property (nonatomic, retain) NSMutableArray *Challenges;
@property (nonatomic, retain) DailyChallenge *TaskFormDailyChallenge;
//@property (nonatomic, retain) NSMutableArray *listOfTasks;
@property (nonatomic, retain) Task *task;
@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextView;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UITextField *taskPointsTextView;
@property (weak, nonatomic) IBOutlet UIButton *addTaskButton;
@property (weak, nonatomic) IBOutlet UIButton *editTaskButton;
@property (weak, nonatomic) IBOutlet UITextField *titleToEditTextField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *removeTaskButton;
@property (weak, nonatomic) IBOutlet UITextView *infoBoxTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *myTaskScrollView;
@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (weak, nonatomic) IBOutlet UISwitch *reminderSwitch;
@property (weak, nonatomic) IBOutlet UITextField *reminderTimeTextField;
@property (weak, nonatomic) IBOutlet UITextView *reminderMessageTextField;
@property (weak, nonatomic) IBOutlet UILabel *reeminderTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *reminderMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *editedAllButton;
@property (weak, nonatomic) IBOutlet UITextView *jsonTextView;
@property (weak, nonatomic) IBOutlet UIButton *createJSONButton;



- (IBAction)reminderSwitchAction:(id)sender;


- (IBAction)addTask:(id)sender;
- (IBAction)editTask:(id)sender;
- (IBAction)done:(id)sender;
- (NSString *)printTaskToScreen: (NSMutableArray *) taskList;
- (IBAction)removeTask:(id)sender;
- (IBAction)editedAll:(id)sender;
- (IBAction)createJSON:(id)sender;

@end
