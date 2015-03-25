//
//  HelperClass.m
//  Information
//
//  Created by Roshan Lamichhane on 3/25/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

#import "HelperClass.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Tutor.h"
#import "Student.h"
#import "Staff.h"


@implementation HelperClass



//Creating a sample data to populate the student
+(void) createSampleDataForTutor     {

    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    //Create NSManagedObjectContext instance
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error ;
    Tutor *firstTutor;
    firstTutor = [NSEntityDescription insertNewObjectForEntityForName:@"Tutor" inManagedObjectContext:context];
    
    [firstTutor setSalary:@"$10000"];
    [firstTutor setFirstName:@"Ramesh"];
    [firstTutor setLastName:@"Sharma"];
    [firstTutor setContactNumber:[NSNumber numberWithInt:3474716514]];
    [firstTutor setEmail:@"schoolwork.roshan@gmail.com"];
    
    [context save:&error];

}


+(void) printTutors {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    //Create NSManagedObjectContext instance
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    //Create fetch request for the entity
    NSFetchRequest *fetchRequest= [NSFetchRequest fetchRequestWithEntityName:@"Tutor"];
    //Store the fetch request in an array
    NSArray *arrayofTutors = [context executeFetchRequest:fetchRequest error:&error];
    for (Tutor *objects in arrayofTutors) {
        NSLog(@"%@ %@ ",objects.firstName,objects.lastName);
    }
}








@end
