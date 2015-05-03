//
//  PickerPopUpViewController.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/5/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "PickerPopUpViewController.h"

@interface PickerPopUpViewController ()

@end

@implementation PickerPopUpViewController


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
    
    _Picker.delegate = self;
    [_Picker selectRow:0 inComponent:0 animated:YES];
	// Do any additional setup after loading the view.
    NSString * combinedStuff;
    if(_addAllSwitch.on && _list.count == 0)
    {
        [_list addObjectsFromArray:_options];
    }
    combinedStuff = [_list componentsJoinedByString:@"  "];
    _InfoBox.text = combinedStuff;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [_options count];
}
//
- (UIView *)pickerView:(UIPickerView *)pickerView
			viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component
		   reusingView:(UIView *)view
{
	UILabel *eduLabel;
	eduLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,180,32)];
	eduLabel.backgroundColor=[UIColor clearColor];
	eduLabel.text=[_options objectAtIndex:row];
    if(eduLabel.text.length > 22)
    {
        	eduLabel.font = [UIFont systemFontOfSize:10];
    }
	else
    {
        eduLabel.font = [UIFont systemFontOfSize:18];
    }
	return eduLabel;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    switch(component) {
        case 0: return 22;
        case 1: return 44;
        case 2: return 88;
        default: return 22;
    }
    
    //NOT REACHED
    return 22;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component
{
	_currentIndex= [pickerView selectedRowInComponent:0];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearAllOptions:(id)sender {
    if([_list count])
    [_list removeAllObjects];
    _InfoBox.text = @"";
    _addAllSwitch.on = false;
}

- (IBAction)Add:(id)sender {
    NSString *option = [_options objectAtIndex:_currentIndex];
    if (![_list containsObject:option]) {
            [_list addObject:option];
    }

    NSString * combinedStuff = [_list componentsJoinedByString:@"  "];
    _InfoBox.text = combinedStuff;
    self.addAllSwitch.on = false;
}
//
- (IBAction)Remove:(id)sender {
     NSString *option = [_options objectAtIndex:_currentIndex];
    [_list removeObject:option];
    NSString * combinedStuff = [_list componentsJoinedByString:@"  "];
    _InfoBox.text = combinedStuff;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if(self.addAllSwitch.on)
//    {
//        [ _list addObjectsFromArray:_options];
//            NSString * combinedStuff = [_list componentsJoinedByString:@"  "];
//        _InfoBox.text = combinedStuff;
//    }
    CreatorOptionsViewController *optionsController = [segue destinationViewController];
    optionsController.TheDailyChallenge = [[DailyChallenge alloc] init];
    optionsController.TheDailyChallenge = _PopDailyChallenge;
   // optionsController.Challenges = _Challenges;
}


- (void)addObjectsFromArrayWithoutDuplicates:(NSMutableArray *)addingTo
                                      arrayAddingFrom:(NSMutableArray *)addingFrom {
    for (NSString *str in addingFrom)
    {
        if( ![addingTo containsObject:str])
        {
            [addingTo addObject:str];
        }
    }
}

- (IBAction)addAllSwitchedOn:(id)sender {
    [self addObjectsFromArrayWithoutDuplicates:_list arrayAddingFrom:_options];
  NSString *combinedStuff = [_list componentsJoinedByString:@"  "];
_InfoBox.text = combinedStuff;
}
@end
