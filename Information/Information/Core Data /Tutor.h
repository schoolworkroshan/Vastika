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


@interface Tutor : Person

@property (nonatomic, retain) NSString * speciality;
@property (nonatomic, retain) NSString * salary;

@end
