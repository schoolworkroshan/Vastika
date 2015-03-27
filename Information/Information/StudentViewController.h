//
//  StudentViewController.h
//  Information
//
//  Created by Roshan Lamichhane on 3/26/15.
//  Copyright (c) 2015 Vastika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentViewController : UIViewController <UITextFieldDelegate>

//Instance variables to hold the student information

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *middleName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *degree;
@property (weak, nonatomic) IBOutlet UITextField *contact;
@property (weak, nonatomic) IBOutlet UISwitch *trainingSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *workingSwithch;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIButton *signUpButtonLabel;
@property (nonatomic, assign) NSString  *training;
@property (nonatomic,assign) NSString   * working;
- (IBAction)trainingSwitch:(id)sender;
- (IBAction)workingSwitch:(id)sender;
- (IBAction)signUpButton:(id)sender;
@end
