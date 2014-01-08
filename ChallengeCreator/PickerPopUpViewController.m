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

@synthesize PickerLabel;
@synthesize Picker;
@synthesize list;
@synthesize options;
@synthesize title;
@synthesize currentIndex;
@synthesize InfoBox;
@synthesize PopDailyChallenge;

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
    Picker.delegate = self;
    [Picker selectRow:0 inComponent:0 animated:YES];
	// Do any additional setup after loading the view.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [options count];
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
	eduLabel.text=[options objectAtIndex:row];
	//eduLabel.textAlignment = UITextAlignmentCenter;
	eduLabel.font = [UIFont systemFontOfSize:22];
	return eduLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
	   inComponent:(NSInteger)component
{
	currentIndex= [pickerView selectedRowInComponent:0];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Add:(id)sender {
    NSString *option = [options objectAtIndex: currentIndex];
    [list addObject:option];
    NSString * combinedStuff = [list componentsJoinedByString:@"  "];
    InfoBox.text = combinedStuff;
}
//
- (IBAction)Remove:(id)sender {
     NSString *option = [options objectAtIndex: currentIndex];
    [list removeObject:option];
    NSString * combinedStuff = [list componentsJoinedByString:@"  "];
    InfoBox.text = combinedStuff;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([title isEqualToString:@"School"])
    {
        CreatorOptionsViewController *optionsController = [segue destinationViewController];
        PopDailyChallenge.schoolLevelExcludes = [[NSMutableArray alloc] initWithArray:list copyItems:true];
        optionsController.TheDailyChallenge = [[DailyChallenge alloc] init];
        optionsController.TheDailyChallenge = PopDailyChallenge;
        //optionsController.TheDailyChallenge.schoolLevelExcludes = [[NSMutableArray alloc] initWithArray:list copyItems:true];
        //optionsController.TheDailyChallenge.schoolLevelExcludes = list;
    }
    else if([title isEqualToString:@"Work"])
    {
        CreatorOptionsViewController *optionsController = [segue destinationViewController];
        optionsController.TheDailyChallenge = [[DailyChallenge alloc] init];
        optionsController.TheDailyChallenge = PopDailyChallenge;
        optionsController.TheDailyChallenge.schoolLevelExcludes = list;
    }
}
//- (IBAction)Done:(id)sender {
//}
@end
