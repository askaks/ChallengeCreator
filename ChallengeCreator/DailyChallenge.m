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
    [encoder encodeInteger:_ageMin forKey:@"min"];
	[encoder encodeInteger:_ageMax forKey:@"max"];
    [encoder encodeInteger:_minimumRiskFactor forKey:@"minimumRiskFactor"];
    [encoder encodeInteger:_pointsWorth forKey:@"pointsWorth"];
    [encoder encodeInteger:_language forKey:@"language"];
    
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
    

    
}

- (id)init
{
    self = [super init];
 	if (self)
	{
        _title = @"start";
        _tasks = [[NSMutableArray alloc] init];
        _ageMax = 200;
        _ageMin = 1;
        _pointsWorth = 0;
        _minimumRiskFactor = 1;
        _language = 1;

        _genderExcludes = [[NSMutableArray alloc] init];
        _interestedInExcludes = [[NSMutableArray alloc] init];
        
        _schoolHappyExcludes = [[NSMutableArray alloc] init];
        _schoolLevelExcludes = [[NSMutableArray alloc] init];
        
        _workHappyExcludes = [[NSMutableArray alloc] init];
        _workLevelExcludes =[[NSMutableArray alloc] init];
        
        _relationshipHappyExcludes = [[NSMutableArray alloc] init];
        _relationshipLevelExcludes = [[NSMutableArray alloc] init];

        _kidsExclude = [[NSMutableArray alloc] init];
        _petsExclude = [[NSMutableArray alloc] init];
        
//        personalityExclude = [[NSMutableArray alloc] init];

        
        _completed = false;

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
        self.ageMin = [decoder decodeIntegerForKey: @"min"];
		self.ageMax = [decoder decodeIntegerForKey: @"max"];
        self.language = [decoder decodeIntegerForKey: @"language"];
        self.minimumRiskFactor = [decoder decodeIntegerForKey: @"minimumRiskFactor"];
        self.pointsWorth = [decoder decodeIntegerForKey: @"pointsWorth"];

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
    challenge.ageMin = _ageMin;
	challenge.ageMax = _ageMax;
    challenge.language = _language;
    challenge.pointsWorth = _pointsWorth;
    challenge.minimumRiskFactor = _minimumRiskFactor;
    
    challenge.genderExcludes = [_genderExcludes copy];
    challenge.interestedInExcludes = [_interestedInExcludes copy];
    
    challenge.schoolLevelExcludes = [_schoolLevelExcludes copy];
    challenge.schoolHappyExcludes = [_schoolHappyExcludes copy];
    
    challenge.workLevelExcludes = [_workLevelExcludes copy];
    challenge.workHappyExcludes = [_workHappyExcludes copy];
    
    challenge.relationshipLevelExcludes = [_relationshipLevelExcludes copy];
    challenge.relationshipHappyExcludes = [_relationshipHappyExcludes copy];
    
    challenge.completed = _completed;
    
    challenge.kidsExclude = [_kidsExclude copy];
    challenge.petsExclude = [_petsExclude copy];

    
    return challenge;
}

@end
