//
//  LoginViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "FriendsViewController.h"



@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor orangeColor];
    [_loginButton.layer setCornerRadius:4.0];
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setBorderWidth:1.0];
    [_loginButton.layer setBorderColor:[UIColor orangeColor].CGColor];
    
    
    UIImageView *accountImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_account.png"]];
    accountImageView.frame = CGRectMake(0, 0, 30, 30);
    self.accountTextField.leftView = accountImageView;
    self.accountTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *passwordImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"psw1.png"]];
    passwordImageView.frame = CGRectMake(0, 0, 30, 30);
    self.passwordTextField.leftView = passwordImageView;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    
    self.navigationController.navigationBarHidden = YES;
    
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    
}

//- (void)keyboardHide:(UITapGestureRecognizer *)tap
//{
//    [self.view endEditing:YES];
//}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    [textField resignFirstResponder];
    
    return true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(AppDelegate*) appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)changeToRegisteView:(id)sender {
    RegistViewController *registViewController = [[RegistViewController alloc]initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:registViewController animated:YES];
}
- (IBAction)login:(id)sender {
    AppDelegate * appDelegate = [self appDelegate];
//        if(![self.accountTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""]){
//            [[NSUserDefaults standardUserDefaults]setObject:self.accountTextField.text forKey:USERID];
//            [[NSUserDefaults standardUserDefaults]setObject:self.passwordTextField.text forKey:PASSWORD];
//        [appDelegate connect];
//
//        }else{
//            UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"请输入用户名和密码" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//        }
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:USERID];
                [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:PASSWORD];
            [appDelegate connect];
}






@end
