//
//  ViewController.m
//  Information
//
//  Created by Roshan Lamichhane on 3/25/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

#import "ViewController.h"
#import "HelperClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [HelperClass createSampleDataForTutor];
    [HelperClass printTutors];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //Made some changes here
}

@end
