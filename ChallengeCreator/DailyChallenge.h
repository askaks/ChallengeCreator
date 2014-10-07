//
//  DailyChallenge.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Task.h"

@interface DailyChallenge : NSObject <NSCoding, NSCopying> 

//////////////////////////////////////////////////////
//
// no need to declare variable, just the @property
//
//////////////////////////////////////////////////////

@property (nonatomic, retain) NSString *title;
@property (nonatomic, assign) NSInteger ageMin;
@property (nonatomic, assign) NSInteger ageMax;
@property (nonatomic, assign) NSInteger pointsWorth;
@property (nonatomic, assign) NSInteger minimumRiskFactor;
@property (nonatomic, assign) NSInteger language;


@property (nonatomic, retain) NSArray *genderExcludes;

@property (nonatomic, retain) NSArray *interestedInExcludes;

@property (nonatomic, retain) NSArray *workLevelExcludes;
@property (nonatomic, retain) NSArray *workHappyExcludes;

@property (nonatomic, retain) NSArray *schoolLevelExcludes;
@property (nonatomic, retain) NSArray *schoolHappyExcludes;

@property (nonatomic, retain) NSArray *relationshipLevelExcludes;
@property (nonatomic, retain) NSArray *relationshipHappyExcludes;

@property (nonatomic, retain) NSArray *femaleExcl;
//@property (nonatomic, retain) NSString *maleExcl;
@property (nonatomic, retain) NSString *schoolSpecific;
@property (nonatomic, retain) NSString *schoolLevel;
@property (nonatomic, retain) NSString *workSpecific;
@property (nonatomic, retain) NSString *workType;
@property (nonatomic, retain) NSString *relationshipSpecific;
@property (nonatomic, retain) NSString *happyWithWork;
@property (nonatomic, retain) NSString *continueStudying;
@property (nonatomic, retain) NSString *happyWithRelationship;
//@property (nonatomic, retain) NSString *language;

@property (nonatomic, retain) NSMutableArray *tasks;
@property (nonatomic, retain) NSMutableArray *relationshipExcludes;
@property (nonatomic, retain) NSMutableArray *schoolExcludes;
@property (nonatomic, retain) NSMutableArray *workExcludes;

@property (nonatomic, retain) NSArray *kidsExclude;
@property (nonatomic, retain) NSArray *petsExclude;
//@property (nonatomic, retain) NSMutableArray *personalityExclude;



@property bool completed;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

- (id)initWithDay: (NSString *)d
            tasks: (NSMutableArray *)array;

- (id)copyWithZone:(NSZone *)zone;


@end
