//
//  StudentViewController.m
//  Information
//
//  Created by Roshan Lamichhane on 3/26/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//
#import "StudentViewController.h"
#import <Parse/Parse.h>
@interface StudentViewController ()

@end

@implementation StudentViewController
@synthesize trainingSwitch, workingSwithch, firstName, lastName, middleName, confirmPassword, password,userName, contact, degree, email, training, working, signUpButtonLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    trainingSwitch.on=NO;
    workingSwithch.on=NO;
    signUpButtonLabel.enabled =NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)trainingSwitch:(id)sender {
    if(trainingSwitch.on){
        training=@"Yes";
    }
    else {
        training=@"NO";
    }
    
}


- (IBAction)workingSwitch:(id)sender {
    if(workingSwithch.on){
        working=@"YES";
    }
    else{
        working=@"NO";
    }
}


//Sign up as a student

- (IBAction)signUpButton:(id)sender {
   
    [self checkNoEmptyField];
    if([self matchingPassword] == TRUE){
        signUpButtonLabel.enabled=YES;
        
    }
    else {
        signUpButtonLabel.enabled=NO;
    }
    
    [self createStudentAccount];
    
}


//Create a student account

-(void) createStudentAccount {
    
    PFUser *student = [PFUser user];
    student.username= userName.text;
    student.password= password.text;
    student.email=email.text;
    
    student[@"firstName"]=firstName.text;
    student[@"middleName"]=middleName.text;
    student[@"lastName"]=lastName.text;
    student[@"contact"]=contact.text;
    student[@"degree"]=degree.text;
    student[@"working"]=working;
    student[@"training"]=training;
    
    [student signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSLog(@"Sorry");
        }
    }];
    
}

//Boolean to check if the values match
-(BOOL) matchingPassword {
    if([password.text isEqualToString:confirmPassword.text]){
        return YES;
    }
    else{
    
        return NO;
    }
}

//Making sure all the fields are filled

-(void) checkNoEmptyField {
    if([firstName.text isEqualToString:@""]|| [lastName.text isEqualToString:@""] ||[contact.text isEqualToString:@""] || [degree.text isEqualToString:@""] || [userName.text isEqualToString:@""] || [password.text isEqualToString:@""])
    {
        
    }
    else {
        [self matchingPassword];
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}


    
@end
