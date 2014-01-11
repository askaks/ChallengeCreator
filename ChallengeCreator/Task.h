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
//@property (nonatomic, retain) NSString *timeSpecific;
//@property (nonatomic, retain) NSString *time;
@property (nonatomic, assign) NSInteger points;
//@property (nonatomic, retain) NSString *workSpecific;
//@property bool completed; // why was *completed?

- (void)encodeWithCoder: (NSCoder *)encoder;
- (id)initWithCoder: (NSCoder *)decoder;

//- (id)initWithMessage: (NSString *)msg
//                 time: (NSString *)t
//         timeSpecific: (NSString *)ts
//               points: (NSInteger)iPoints
//               ageMin: (NSString *)min
//               ageMax: (NSString *)max
//           femaleExcl: (NSString *)female
//             maleExcl: (NSString *)male
//       schoolSpecific: (NSString *)ss
//                scool: (NSString *)school
//         workSpecific: (NSString *)ws
//            completed: (bool) bCompleted;

- (id)initWithMessage: (NSString *)msg
               points: (NSInteger )iPoints
                title: (NSString *)title;

@end
