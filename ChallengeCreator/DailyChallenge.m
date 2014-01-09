//
//  DailyChallenge.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DailyChallenge.h"

@implementation DailyChallenge

@synthesize title;
@synthesize tasks;
@synthesize ageMin;
@synthesize ageMax;
@synthesize genderExcludes;
@synthesize interestedInExcludes;

@synthesize workLevelExcludes;
@synthesize workHappyExcludes;

@synthesize schoolLevelExcludes;
@synthesize schoolHappyExcludes;

@synthesize relationshipLevelExcludes;
@synthesize relationshipHappyExcludes;

@synthesize pointsWorth;
@synthesize completed;

@synthesize kidsExclude;
@synthesize petsExclude;
//@synthesize personalityExclude;
@synthesize language;
@synthesize minimumRiskFactor;

- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:title forKey: @"title"];
    
    [encoder encodeObject:tasks forKey: @"tasks"];
    
    [encoder encodeObject: ageMin forKey: @"min"];
    
	[encoder encodeObject: ageMax forKey: @"max"];
    
    [encoder encodeObject:genderExcludes forKey: @"genderExcludes"];
    
    [encoder encodeObject: interestedInExcludes forKey: @"interestedInExcludes"];
    
    [encoder encodeObject: schoolLevelExcludes forKey: @"schoolLevelExcludes"];

    [encoder encodeObject: schoolHappyExcludes forKey: @"schoolHappyExcludes"];
   
    [encoder encodeObject: workLevelExcludes forKey: @"workLevelExcludes"];
    
    [encoder encodeObject: workHappyExcludes forKey: @"workHappyExcludes"];

    [encoder encodeObject: relationshipLevelExcludes forKey: @"relationshipLevelExcludes"];

    [encoder encodeObject: relationshipHappyExcludes forKey: @"relationshipHappyExcludes"];
    
    [encoder encodeBool:completed forKey:@"completed" ];

    [encoder encodeObject: petsExclude forKey: @"petsExclude"];
    
    [encoder encodeObject: kidsExclude forKey: @"kidsExclude"];
    
    [encoder encodeInteger:minimumRiskFactor forKey: @"minimumRiskFactor"];
    [encoder encodeInteger:pointsWorth forKey: @"pointsWorth"];
    [encoder encodeInteger: language forKey: @"language"];
    
}

- (id)init
{
 	if (self == [super init]) 
	{
        title = @"start";
        tasks = [[NSMutableArray alloc] init];
        ageMax = [[NSString alloc] initWithFormat:@"%d", 0];
        ageMin = [[NSString alloc] initWithFormat:@"%d", 0];

        genderExcludes = [[NSMutableArray alloc] init];
        interestedInExcludes = [[NSMutableArray alloc] init];
        
        schoolHappyExcludes = [[NSMutableArray alloc] init];
        schoolLevelExcludes = [[NSMutableArray alloc] init];
        
        workHappyExcludes = [[NSMutableArray alloc] init];
        workLevelExcludes =[[NSMutableArray alloc] init];
        
        relationshipHappyExcludes = [[NSMutableArray alloc] init];
        relationshipLevelExcludes = [[NSMutableArray alloc] init];

        kidsExclude = [[NSMutableArray alloc] init];
        petsExclude = [[NSMutableArray alloc] init];
        
//        personalityExclude = [[NSMutableArray alloc] init];
        
        language = 0;
        
        completed = false;
        pointsWorth = 0;
        minimumRiskFactor = 0;        
    }   
    
	return self;
}

- (id)initWithCoder: (NSCoder *)decoder
{
	if (self == [super init]) 
    {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.tasks = [decoder decodeObjectForKey:@"tasks"];
        self.ageMin = [decoder decodeObjectForKey: @"min"];
		self.ageMax = [decoder decodeObjectForKey: @"max"];

        self.genderExcludes = [decoder decodeObjectForKey:@"genderExcludes"];

        self.interestedInExcludes = [decoder decodeObjectForKey:@"interestedInExcludes"];

        self.schoolLevelExcludes = [decoder decodeObjectForKey:@"schoolLevelExcludes"];

        self.schoolHappyExcludes = [decoder decodeObjectForKey:@"schoolHappyExcludes"];
        
        self.workLevelExcludes = [decoder decodeObjectForKey: @"workLevelExcludes"];
        
        self.workHappyExcludes = [decoder decodeObjectForKey: @"workHappyExcludes"];
        
        self.relationshipLevelExcludes = [decoder decodeObjectForKey: @"relationshipLevelExcludes"];
        
        self.relationshipHappyExcludes = [decoder decodeObjectForKey: @"relationshipHappyExcludes"];
        
        self.completed = [decoder decodeBoolForKey:@"completed"];
        
        self.kidsExclude = [decoder decodeObjectForKey: @"kidsExclude"];
        
        self.petsExclude = [decoder decodeObjectForKey: @"petsExclude"];
        
        self.language = [decoder decodeIntegerForKey: @"language"];
        self.minimumRiskFactor = [decoder decodeIntegerForKey: @"minimumRiskFactor"];
        
        self.pointsWorth = [decoder decodeIntegerForKey: @"pointsWorth"];
        
    }
	return self;
}

- (id)initWithDay: (NSString *)d
            tasks: (NSMutableArray *)array
{
 	if (self == [super init]) 
	{
        title = d; 
        tasks = [[NSMutableArray alloc] initWithArray:array]; 
    }   
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	DailyChallenge *challenge = [[DailyChallenge alloc] init];
    
    challenge.title = self.title;
    challenge.tasks = [self.tasks copy];
    challenge.ageMin = [NSString stringWithString:ageMin];
	challenge.ageMax = [NSString stringWithString:ageMax];
    
    challenge.genderExcludes = [self.genderExcludes copy];
    challenge.interestedInExcludes = [self.interestedInExcludes copy];
    
    challenge.schoolLevelExcludes = [self.schoolLevelExcludes copy];
    challenge.schoolHappyExcludes = [self.schoolHappyExcludes copy];
    
    challenge.workLevelExcludes = [self.workLevelExcludes copy];
    challenge.workHappyExcludes = [self.workHappyExcludes copy];
    
    challenge.relationshipLevelExcludes = [self.relationshipLevelExcludes copy];
    challenge.relationshipHappyExcludes = [self.relationshipHappyExcludes copy];
    
    challenge.completed = self.completed;
    
    challenge.kidsExclude = [self.kidsExclude copy];
    challenge.petsExclude = [self.petsExclude copy];
    
//    challenge.personalityExclude = [self.personalityExclude copy];
    
    challenge.language = self.language;
    challenge.pointsWorth = self.pointsWorth;
    challenge.minimumRiskFactor = self.minimumRiskFactor;
    
    return challenge;
}

@end
