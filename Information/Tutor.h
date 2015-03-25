//
//  Tutor.h
//  Information
//
//  Created by Roshan Lamichhane on 3/25/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"

@class Student;

@interface Tutor : Person

@property (nonatomic, retain) NSString * salary;
@property (nonatomic, retain) NSString * speciality;
@property (nonatomic, retain) NSSet *students;
@end

@interface Tutor (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Student *)value;
- (void)removeStudentsObject:(Student *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end
