//
//  AboutMyViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "AboutMyViewController.h"
#import "FunctionType.h"
#import "MessageViewController.h"
#import "ChangePasswordViewController.h"
#import "NewRemindViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface AboutMyViewController ()

@end

@implementation AboutMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    
    self.title = @"我的";
    
    self.tableView.scrollEnabled = NO;
    
    FunctionType *type1 = [[FunctionType alloc]init];
    type1.name = @"更改密码";
    type1.image = [MessageViewController scale:[UIImage imageNamed:@"account_security"] toSize:CGSizeMake(30, 30)];
    
    FunctionType *type2 = [[FunctionType alloc]init];
    type2.name = @"新消息通知";
    type2.image = [MessageViewController scale:[UIImage imageNamed:@"noti_news"] toSize:CGSizeMake(30, 30)];
    
    FunctionType *type3 = [[FunctionType alloc]init];
    type3.name = @"关于";
    type3.image = [MessageViewController scale:[UIImage imageNamed:@"about"] toSize:CGSizeMake(30, 30)];
    self.types = [NSMutableArray arrayWithObjects: type1, type2, type3, nil];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:16];
    }
    FunctionType *item = [self.types objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    cell.imageView.image = item.image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ChangePasswordViewController *changePasswordViewController = [[ChangePasswordViewController alloc]initWithNibName:@"ChangePasswordViewController" bundle:nil];
    NewRemindViewController *newRemindViewController = [[NewRemindViewController alloc]initWithNibName:@"NewRemindViewController" bundle:nil];
   
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:changePasswordViewController animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:newRemindViewController animated:YES];
            break;
        case 2:
            break;
        default:
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)quitApp:(id)sender {
     LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate disconnect];
    delegate.navigationController = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    [(UIWindow*)([[UIApplication sharedApplication].windows objectAtIndex:0]) setRootViewController:delegate.navigationController];

}
@end
