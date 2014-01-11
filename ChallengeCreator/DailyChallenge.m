//
//  DailyChallenge.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "DailyChallenge.h"

@implementation DailyChallenge

//////////////////////////////////////////////////////////////////////////
//
// no need to synthesize: all internal variables must be with underscore
// like e.g. _title or self.title
//
//////////////////////////////////////////////////////////////////////////

- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:_title forKey:@"title"];
    
    [encoder encodeObject:_tasks forKey:@"tasks"];
    
    [encoder encodeObject:_ageMin forKey:@"min"];
    
	[encoder encodeObject:_ageMax forKey:@"max"];
    
    [encoder encodeObject:_genderExcludes forKey:@"genderExcludes"];
    
    [encoder encodeObject:_interestedInExcludes forKey:@"interestedInExcludes"];
    
    [encoder encodeObject:_schoolLevelExcludes forKey:@"schoolLevelExcludes"];

    [encoder encodeObject:_schoolHappyExcludes forKey:@"schoolHappyExcludes"];
   
    [encoder encodeObject:_workLevelExcludes forKey:@"workLevelExcludes"];
    
    [encoder encodeObject:_workHappyExcludes forKey:@"workHappyExcludes"];

    [encoder encodeObject:_relationshipLevelExcludes forKey:@"relationshipLevelExcludes"];

    [encoder encodeObject:_relationshipHappyExcludes forKey:@"relationshipHappyExcludes"];
    
    [encoder encodeBool:_completed forKey:@"completed"];

    [encoder encodeObject:_petsExclude forKey:@"petsExclude"];
    
    [encoder encodeObject:_kidsExclude forKey:@"kidsExclude"];
    
    [encoder encodeInteger:_minimumRiskFactor forKey:@"minimumRiskFactor"];
    [encoder encodeInteger:_pointsWorth forKey:@"pointsWorth"];
    [encoder encodeInteger:_language forKey:@"language"];
    
}

- (id)init
{
    self = [super init];
 	if (self)
	{
        _title = @"start";
        _tasks = [[NSMutableArray alloc] init];
        _ageMax = [[NSString alloc] initWithFormat:@"%d", 0];
        _ageMin = [[NSString alloc] initWithFormat:@"%d", 0];

        _genderExcludes = [[NSMutableArray alloc] init];
        _interestedInExcludes = [[NSMutableArray alloc] init];
        
        _schoolHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
        _schoolLevelExcludes = [[NSMutableArray alloc] init];
        
        _workHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
        _workLevelExcludes =[[NSMutableArray alloc] init];
        
        _relationshipHappyExcludes = [[NSString alloc] initWithFormat:@"false"];
        _relationshipLevelExcludes = [[NSMutableArray alloc] init];

        _kidsExclude = [[NSMutableArray alloc] init];
        _petsExclude = [[NSMutableArray alloc] init];
        
//        personalityExclude = [[NSMutableArray alloc] init];
        
        _language = 0;
        
        _completed = false;
        _pointsWorth = 0;
        _minimumRiskFactor = 0;
    }   
    
	return self;
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
	if (self) 
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
    self = [super init];
 	if (self) 
	{
        self.title = d;
        self.tasks = [NSMutableArray arrayWithArray:array];
    }   
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
	DailyChallenge *challenge = [[DailyChallenge alloc] init];
    
    challenge.title = _title;
    challenge.tasks = [_tasks copy];
    challenge.ageMin = [NSString stringWithString:_ageMin];
	challenge.ageMax = [NSString stringWithString:_ageMax];
    
    challenge.genderExcludes = [_genderExcludes copy];
    challenge.interestedInExcludes = [_interestedInExcludes copy];
    
    challenge.schoolLevelExcludes = [_schoolLevelExcludes copy];
    challenge.schoolHappyExcludes = [NSString stringWithString:_schoolHappyExcludes];
    
    challenge.workLevelExcludes = [_workLevelExcludes copy];
    challenge.workHappyExcludes = [NSString stringWithString:_workHappyExcludes];
    
    challenge.relationshipLevelExcludes = [_relationshipLevelExcludes copy];
    challenge.relationshipHappyExcludes = [NSString stringWithString:_relationshipHappyExcludes];
    
    challenge.completed = _completed;
    
    challenge.kidsExclude = [_kidsExclude copy];
    challenge.petsExclude = [_petsExclude copy];
    
//    challenge.personalityExclude = [self.personalityExclude copy];
    
    challenge.language = _language;
    challenge.pointsWorth = _pointsWorth;
    challenge.minimumRiskFactor = _minimumRiskFactor;
    
    return challenge;
}

@end
