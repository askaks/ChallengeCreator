//
//  Task.h
//  iBeHappy
//
//  Created by Jaroslaw Szymczyk on 1/23/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject <NSCoding, NSCopying>


@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *reminderMessage;
//@property (nonatomic, retain) NSString *timeSpecific;
@property (nonatomic, retain) NSString *reminderTime;
@property (nonatomic, assign) NSInteger points;
//@property (nonatomic, retain) NSString *workSpecific;
@property bool setReminder;

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;


- (id)initWithMessage: (NSString *)msg
               points: (NSInteger )iPoints
                title: (NSString *)title;

- (id)initWithMessage:(NSString *)msg
               points:(NSInteger)iPoints
                 time:(NSString *)t
      reminderMessage:(NSString *)reminderMsg
            taskTitle:(NSString *)title;
@end
