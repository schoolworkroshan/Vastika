//
//  Student.h
//  Information
//
//  Created by Roshan Lamichhane on 3/25/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"


@interface Student : Person

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * degree;
@property (nonatomic, retain) NSString * visaStatus;
@property (nonatomic, retain) NSString * interest;
@property (nonatomic, retain) NSNumber * training;
@property (nonatomic, retain) NSNumber * working;
@property (nonatomic, retain) NSNumber * bench;
@property (nonatomic, retain) NSDate * dateJoined;

@end
