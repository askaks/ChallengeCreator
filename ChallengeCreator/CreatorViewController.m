//
//  CreatorViewController.m
//  ChallengeCreator
//
//  Created by Joanna Szymczyk on 1/4/14.
//  Copyright (c) 2014 Joanna Szymczyk. All rights reserved.
//

#import "CreatorViewController.h"

@interface CreatorViewController ()

@end

@implementation CreatorViewController


//@synthesize correctlyLoadedXMLLabel;
//@synthesize Challenges;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 	// Do any additional setup after loading the view, typically from a nib.   
    _Challenges = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoadChallengesXML:(id)sender {
//    NSString *docDir = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Challenges.xml"];
    NSURL *url = [[NSURL alloc] initWithString:@"https://home.comcast.net/~jszymczyk/iBeHappy/Challenges.xml"];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    //Set delegate
    [xmlParser setDelegate:self];
    
    //Start parsing the XML file.
    bool success = [xmlParser parse];
    if (success)
    {
        _correctlyLoadedXMLLabel.text = @"No Errors";
    }
    else
        _correctlyLoadedXMLLabel.text = @"Error Error Error!!!";
}

- (IBAction)createXML:(id)sender {
//    NSString * myCustomXMLString;
//    myCustomXMLString = [NSString stringWithFormat:@"<bacon>%@</bacon>", aString];
}

- (IBAction)writeOutXML:(id)sender {
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatorOptionsViewController *OptionsSurvey = [segue destinationViewController];
    OptionsSurvey.Challenges = _Challenges;
}
@end
