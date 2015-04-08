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

NSString *password;
NSString *confirmpassword;

@implementation StudentViewController
@synthesize trainingSwitch, workingSwithch, firstName, lastName, middleName, confirmPassword, password,userName, contact, degree, email, training, working,signUpButtonLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    trainingSwitch.on=NO;
    workingSwithch.on=NO;
    signUpButtonLabel.enabled=NO;
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

- (IBAction)signUpButtn:(id)sender {
   
      [self createStudentAccount];
      [self dismissViewControllerAnimated:YES completion:nil];
}


//Sign up as a student




//Create a student account
//

-(void) createStudentAccount {
    
    PFUser *student = [PFUser user];
    student.username= userName.text;
    student.password= password.text;
    student.email=email.text;
    
    student[@"firstName"]=firstName.text;
    NSString *string =middleName.text;
    if (string.length == 0) {
            student[@"middleName"]= @"no middle name" ;
        }
        else {
            student[@"middleName"] = string;
        }
    
    
    student[@"lastName"]=lastName.text;
    student[@"contact"]=contact.text;
    student[@"degree"]=degree.text;
//    student[@"working"]=working;
//    student[@"training"]=training;
    student[@"Type"]=@"student";
    [PFACL setDefaultACL:[PFACL ACL] withAccessForCurrentUser:NO];
    
    [student signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
        } else {
            NSLog(@"Sorry");
        }
    }];
    
}

//Boolean to check if the values match
-(BOOL) matchingPassword {
    if([password.text isEqualToString:confirmPassword.text] && [password.text length] >= 5){
        return YES;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Password doesn't match and the length of password should be at least 5 character long" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
}



//Checking the values if they are filled
//Making sure all the fields are filled
//
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    switch (textField.tag) {
        case 0:
            if ([firstName.text isEqualToString:@""] || textField == nil) {
                //Do something else
                UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"First name must be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.firstName becomeFirstResponder];
            }
            break;
      
        case 1 :
            if ([lastName.text isEqualToString:@""]|| textField==nil){
                UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Last name must be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.lastName becomeFirstResponder];
                
            }
            
            break;
            
        case 3:
            if ([email.text length ] < 6  || textField == nil) {
                //Do something else
                UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Email must be at least 6 character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.email becomeFirstResponder];
            }
            break;
            
            
        case 4 : if ([userName.text length ]< 5 || textField == nil) {
            //Do something else
            UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Username be at least 5 character long" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self.userName becomeFirstResponder];
            
        }
            break;
        case 5:
            if ([password.text isEqualToString:@""] || textField == nil) {
                //Do something else
                UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Password must be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.password becomeFirstResponder];
            }
            
            break;
            
            
        case 6 : if ([confirmPassword.text isEqualToString:@""] || textField == nil) {
            //Do something else
            UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Confirm password must be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self.confirmPassword becomeFirstResponder];
            
        }
            [self matchingPassword];
        break;
            
        case 7:
            if ([degree.text isEqualToString:@""] || textField == nil ) {
                //Do something else
                UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Degree must be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                [self.degree becomeFirstResponder];
            }
            break;
            
        case 8: if (contact.text.length<10 || textField == nil) {
            //Do something else
            UIAlertView *alert = [[UIAlertView alloc ]initWithTitle:@"Sorry" message:@"Contact must  be filled" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [self.contact becomeFirstResponder];
        }
            break;
        default: NSLog(@"Sorry");
            break;
    }
    
    [textField resignFirstResponder];
    return YES;
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
 NSUInteger textLength = [textField.text length];
    NSLog(@"Textfield Length :%li",textLength);
    return YES;
}


-(void)textFieldDidEndEditing:(UITextField *)textField {
    if(self.firstName.text.length>0 && self.lastName.text.length>0 && self.userName.text.length>=5 && self.email.text.length>5 && self.password.text.length>=5 & self.confirmPassword.text.length>=5 && [self.password.text isEqualToString:self.confirmPassword.text]  && self.degree.text.length>0 && self.contact.text.length == 10) {
        
        signUpButtonLabel.enabled=YES;
    }
    else {
         signUpButtonLabel.enabled=NO;
    }
}
    
@end
