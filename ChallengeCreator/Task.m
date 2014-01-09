//
//  Task.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize message;
@synthesize timeSpecific;
@synthesize time;
@synthesize points;
@synthesize workSpecific;
@synthesize completed;

- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject: message forKey: @"message"];
    [encoder encodeObject: timeSpecific forKey: @"tspec"];
    [encoder encodeObject: time forKey: @"time"];
    [encoder encodeInteger: points forKey: @"points"];
	[encoder encodeBool: completed forKey: @"completed"];
}

- (id)initWithCoder: (NSCoder *)decoder
{
	if (self == [super init]) 
    {
        self.message = [decoder decodeObjectForKey: @"message"];
        //self.timeSpecific = [decoder decodeObjectForKey: @"tspec"];
        self.time = [decoder decodeObjectForKey: @"time"];
        self.points = [decoder decodeIntegerForKey: @"points"];
        //self.completed = [decoder decodeBoolForKey: @"completed"];
    }    
	return self;
}
//
//- (id)initWithMessage:(NSString *)msg
//{
// 	if (self == [super init]) 
//	{
//        message = [[NSString alloc] initWithString: msg];
//        time = [[NSString alloc] initWithFormat:@"%d", 0]; 
//        timeSpecific = @"false"; 
//        points =  25;
//        completed = false;
//    }   
//    
//	return self;
//}

- (id)initWithMessage: (NSString *)msg
               points: (NSInteger)iPoints
{
 	if (self == [super init])
	{
        message = [[NSString alloc] initWithString: msg];
        points = iPoints;
    }
    
	return self;
}

//- (id)initWithMessage: (NSString *)msg
//                 time: (NSString *)t 
//         timeSpecific: (NSString *)ts 
//             points: (NSInteger *)iPoints
//               ageMin: (NSString *)min
//               ageMax: (NSString *)max
//           femaleExcl: (NSString *)female
//             maleExcl: (NSString *)male
//       schoolSpecific: (NSString *)ss
//                scool: (NSString *)school
//         workSpecific: (NSString *)ws
//                 completed: (bool) bCompleted
//{
// 	if (self == [super init]) 
//	{
//        message = [[NSString alloc] initWithString: msg];
//        time = [[NSString alloc] initWithString: t]; 
//        timeSpecific = [[NSString alloc] initWithString: ts]; 
//        points = *iPoints;
//        completed = &bCompleted;
//    }   
//    
//	return self;
//}

- (id)copyWithZone:(NSZone *)zone
{
	Task *task = [[Task alloc] init];
    
    task.message = [NSString stringWithString:message];
    task.time = [NSString stringWithString:time];
    task.timeSpecific = [NSString stringWithString:timeSpecific];
    task.points = points;
    task.completed = completed;
    
    return task;
}


@end
