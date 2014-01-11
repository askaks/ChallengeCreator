//
//  Task.m
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Task.h"

@implementation Task


- (void)encodeWithCoder: (NSCoder *)encoder 
{
    [encoder encodeObject:_message forKey: @"message"];
    [encoder encodeObject:_title forKey: @"title"];
    //[encoder encodeObject:_timeSpecific forKey: @"tspec"];
//    [encoder encodeObject:_time forKey: @"time"];
    [encoder encodeInteger:_points forKey: @"points"];
//	[encoder encodeBool:_completed forKey: @"completed"];
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
	if (self) 
    {
        self.message = [decoder decodeObjectForKey: @"message"];
        self.title = [decoder decodeObjectForKey: @"title"];
        //self.timeSpecific = [decoder decodeObjectForKey: @"tspec"];
//        self.time = [decoder decodeObjectForKey: @"time"];
        self.points = [decoder decodeIntegerForKey: @"points"];
        //self.completed = [decoder decodeBoolForKey: @"completed"];
    }    
	return self;
}

- (id)initWithMessage:(NSString *)msg
{
    self = [super init];
 	if (self)
	{
        _message = [[NSString alloc] initWithString: msg];
//        _time = [[NSString alloc] initWithFormat:@"%d", 0];
//        _timeSpecific = @"false";
        _points =  25;
//        _completed = false;
    }
    
	return self;
}

//- (id)initWithMessage:(NSString *)msg
//                 time:(NSString *)t
//         timeSpecific:(NSString *)ts
//               points:(NSInteger)iPoints // why (NSInteger *)?
//               ageMin:(NSString *)min
//               ageMax:(NSString *)max
//           femaleExcl:(NSString *)female
//             maleExcl:(NSString *)male
//       schoolSpecific:(NSString *)ss
//                scool:(NSString *)school
//         workSpecific:(NSString *)ws
//            completed:(bool)bCompleted
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
title:(NSString *)title
{
    self = [super init];
 	if (self)
	{
        _message = [[NSString alloc] initWithString: msg];
        _points = iPoints;
        _title = title;
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
    
    task.message = [NSString stringWithString:_message];
//    task.time = [NSString stringWithString:_time];
//    task.timeSpecific = [NSString stringWithString:_timeSpecific];
    task.points = _points;
    task.title = [NSString stringWithString:_title];
//    task.completed = _completed;
    
    return task;
}


@end
