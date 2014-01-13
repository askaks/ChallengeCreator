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


- (NSString *)filePath
{
    NSString *docDir =
	[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
										 NSUserDomainMask, YES) objectAtIndex: 0];
	return [docDir stringByAppendingPathComponent: @"XMLstring.dat"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 	// Do any additional setup after loading the view, typically from a nib.   
    _Challenges = [[NSMutableArray alloc] init];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
	
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoadChallengesXML:(id)sender
{
    NSURL *url = [[NSURL alloc] initWithString:@"https://home.comcast.net/~jszymczyk/iBeHappy/Challenges.xml"];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    //Set delegate
    [xmlParser setDelegate:self];
    
    //Start parsing the XML file.
    bool success = [xmlParser parse];
    NSData *xmlData = [[NSData alloc] initWithContentsOfURL:url];
    _downloadedXML = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
                                        
    if (success)
    {
        _correctlyLoadedXMLLabel.text = @"No Errors";
    }
    else
        _correctlyLoadedXMLLabel.text = @"Error Error Error!!!";
}

- (IBAction)createXML:(id)sender
{
    NSString * myChallengeXMLString;
    
    for (DailyChallenge *dailyChallenge in _Challenges)
    {
        NSString * femaleExcludeString = [[NSString alloc] init];
        NSString * taskString = [[NSString alloc] init];
        NSString * schoolString = [[NSString alloc] init];
        NSString * workString = [[NSString alloc] init];
        
        NSString * relationshipString = [[NSString alloc] init];
        NSString * interestedInString = [[NSString alloc] init];
        
        NSString * petString = [[NSString alloc] init];
        NSString * childString = [[NSString alloc] init];
        
        
        if (dailyChallenge.tasks == nil || dailyChallenge.tasks.count <= 0)
        {
            schoolString = @"";
        }
        else
        {
            for (Task *task in dailyChallenge.tasks)
            {
                taskString = [NSString stringWithFormat:@"%@<Task><Message>%@</Message><TaskPoints>%d</TaskPoints></Task>", taskString, task.message, task.points];
            }
        }
        
        
        
        
        if (dailyChallenge.schoolLevelExcludes == nil || dailyChallenge.schoolLevelExcludes.count <= 0)
        {
            schoolString = @"<ExcludeSchoolLevelFilters />";
        }
        else
        {
            for (NSString * school in dailyChallenge.schoolLevelExcludes)
            {
                schoolString = [NSString stringWithFormat:@"%@<ExcludeSchoolLevelFilters>%@</ExcludeSchoolLevelFilters>", schoolString, school];
            }
        }
        
        
        
        if (dailyChallenge.workLevelExcludes == nil || dailyChallenge.workLevelExcludes.count <= 0)
        {
            workString = @"<ExcludeWorkLevelFilters />";
        }
        else
        {
            for (NSString *work in dailyChallenge.workLevelExcludes)
            {
                workString = [NSString stringWithFormat:@"%@<ExcludeWorkLevelFilters>%@</ExcludeWorkLevelFilters>", workString, work];
            }
        }
        
            
        if (dailyChallenge.relationshipLevelExcludes == nil || dailyChallenge.relationshipLevelExcludes <= 0)
        {
            relationshipString = @"<ExcludeRelationshipLevelFilters />";
        }
        else
        {
            for (NSString *relationship in dailyChallenge.relationshipLevelExcludes)
            {
                relationshipString = [NSString stringWithFormat:@"%@<ExcludeRelationshipLevelFilters>%@</ExcludeRelationshipLevelFilters>", relationshipString, relationship];
            }
        }
        
        if (dailyChallenge.genderExcludes == nil || dailyChallenge.genderExcludes.count <= 0)
        {
            femaleExcludeString = @"<ExcludeGenderFilters />";
        }
        else
        {
            for (NSString *gender in dailyChallenge.genderExcludes)
            {
                femaleExcludeString = [NSString stringWithFormat:@"%@<ExcludeGenderFilters>%@</ExcludeGenderFilters>", femaleExcludeString, gender];
            }
        }
        
        
        if (dailyChallenge.interestedInExcludes == nil || dailyChallenge.interestedInExcludes.count <= 0)
        {
            interestedInString = @"<ExcludeInterestedInFilters />";
        }
        else
        {
            for (NSString *interested in dailyChallenge.interestedInExcludes)
            {
                interestedInString = [NSString stringWithFormat:@"%@<ExcludeGenderFilters>%@</ExcludeGenderFilters>", interestedInString, interested];
            }
        }
        

        if (dailyChallenge.kidsExclude == nil || dailyChallenge.kidsExclude.count <= 0)
        {
            childString = @"<ExcludeKidFilters />";
        }
        else
        {
            for (NSString *kids in dailyChallenge.kidsExclude)
            {
                childString = [NSString stringWithFormat:@"%@<ExcludeKidFilters>%@</ExcludeKidFilters>", childString, kids];
            }
        }
        
        
        if (dailyChallenge.petsExclude == nil || dailyChallenge.petsExclude.count <= 0)
        {
            petString = @"<ExcludePetFilters />";
        }
        else
        {
            for (NSString *pets in dailyChallenge.petsExclude)
            {
                petString = [NSString stringWithFormat:@"%@<ExcludePetFilters>%@</ExcludePetFilters>", petString, pets];
            }
        }
        
        myChallengeXMLString = [NSString stringWithFormat:@"%@<Challenge><Title>%@</Title><Points>%d</Points><LanguageRating>%d</LanguageRating><RiskFactor>%d</RiskFactor><AgeMin>%@</AgeMin><AgeMax>%@</AgeMax><Tasks>%@</Tasks><ExcludeWorkHappy>%@</ExcludeWorkHappy><ExcludeRelationshipHappy>%@</ExcludeRelationshipHappy><ExcludeSchoolHappy>%@</ExcludeSchoolHappy>%@%@%@%@%@</Challenge>",myChallengeXMLString,dailyChallenge.title, dailyChallenge.pointsWorth, dailyChallenge.language, dailyChallenge.minimumRiskFactor, dailyChallenge.ageMin, dailyChallenge.ageMax, dailyChallenge.workSpecific, dailyChallenge.relationshipSpecific, dailyChallenge.schoolSpecific, interestedInString, schoolString, workString, relationshipString, childString, petString];
        
        NSString *filePath = [self filePath];
        [myChallengeXMLString writeToFile:filePath atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
        
    }
    
    NSString *fileName = [self filePath];
    
    _tobeUploadedXML = @"testing writing XML to file";
    
    [_tobeUploadedXML writeToFile:fileName atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
    
}

- (IBAction)writeOutXML:(id)sender {
    
    //First delete last tag (challenges) from downloaded xml
    [_downloadedXML delete:@"</Challenges>"];
    _downloadedXML = [_downloadedXML stringByReplacingOccurrencesOfString:@"/Challenges>" withString:@""];
    _tobeUploadedXML = [NSString stringWithFormat:@"%@%@/Challenges>", _downloadedXML, _tobeUploadedXML];
    
    [[NSFileManager defaultManager] createFileAtPath:@"Your/Path" contents:nil attributes:nil];
    //This creates an empty file, which you can write to or read from. To write text (or XML), just use NSString's writeToFile:atomically:encoding:error: method like this
    
    //NSString *str = //Your text or XML
    //[_tobeUploadedXML writeToFile:"Your/Path" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //To read from a file, just make an NSString with the contents of that file

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    CreatorOptionsViewController *OptionsSurvey = [segue destinationViewController];
    OptionsSurvey.Challenges = _Challenges;
}
@end
