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
    [encoder encodeObject:_title forKey: @"title"];
    [encoder encodeInteger:_points forKey: @"points"];
    [encoder encodeObject:_message forKey: @"message"];
    [encoder encodeObject:_reminderMessage forKey: @"reminderMessage"];
    [encoder encodeObject:_reminderTime forKey: @"reminderTime"];
//	[encoder encodeBool:_completed forKey: @"completed"];
}

- (id)initWithCoder: (NSCoder *)decoder
{
    self = [super init];
	if (self) 
    {
        self.title = [decoder decodeObjectForKey: @"title"];
        self.points = [decoder decodeIntegerForKey: @"points"];
        self.message = [decoder decodeObjectForKey: @"message"];
        self.reminderMessage = [decoder decodeObjectForKey: @"reminderMessage"];
        self.reminderTime = [decoder decodeObjectForKey: @"reminderTime"];
    }    
	return self;
}

- (id)initWithMessage:(NSString *)msg
{
    self = [super init];
 	if (self)
	{
        _title = @"Title";
        _message = [[NSString alloc] initWithString: msg];
        _points =  25;
    }
	return self;
}
- (id)initWithMessage:(NSString *)msg
               points:(NSInteger)iPoints
                 time:(NSString *)t
      reminderMessage:(NSString *)reminderMsg
            taskTitle:(NSString *)title
{
    self = [super init];
 	if (self)
	{
        _title = title;
        _message = msg;
        _points = iPoints;
        _reminderTime = t;
        _reminderMessage = reminderMsg;
    }
	return self;
}


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

- (id)copyWithZone:(NSZone *)zone
{
	Task *task = [[Task alloc] init];
    
    task.message = [NSString stringWithString:_message];
    task.reminderTime = [NSString stringWithString:_reminderTime];
    task.reminderMessage = [NSString stringWithString:_reminderMessage];
    task.points = _points;
    task.title = [NSString stringWithString:_title];
    return task;
}


@end
