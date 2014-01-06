//
//  PickerPopUpViewController.h
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/5/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CreatorOptionsViewController.h"

@class CreatorOptionsViewController;

@interface PickerPopUpViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    NSMutableArray *list;
    NSArray *options;
    NSString *title;
    NSInteger currentIndex;
}
@property (nonatomic, retain) NSMutableArray *list;
@property NSInteger currentIndex;
@property (nonatomic, retain) NSArray *options;
@property (nonatomic, retain) NSString *title;
@property (weak, nonatomic) IBOutlet UILabel *PickerLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *Picker;
@property (weak, nonatomic) IBOutlet UIButton *RemoveButton;
@property (weak, nonatomic) IBOutlet UIButton *AddButton;
- (IBAction)Add:(id)sender;
//- (IBAction)Remove:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;
//- (IBAction)Done:(id)sender;

@end
