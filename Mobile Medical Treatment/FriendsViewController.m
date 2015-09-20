//
//  FriendsViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "FriendsViewController.h"
#import "MessageViewController.h"
#import "SearchFriendsViewController.h"
@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"医圈";
    
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithImage:[MessageViewController scale:[UIImage imageNamed:@"message_white_icon"] toSize:CGSizeMake(25, 25)] style:UIBarButtonItemStylePlain target:self action:@selector(addFriend:)];
//    self.navigationItem.rightBarButtonItem = rightButton;
    
//    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"➕" style:UIBarButtonItemStylePlain target:self action:@selector(addFriend:)];
//    
//    
//    self.navigationItem.rightBarButtonItem = rightBtn;
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend:)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addFriend:(id) sender
{
    SearchFriendsViewController *searchFriendsViewController = [[SearchFriendsViewController alloc]initWithNibName:@"SearchFriendsViewController" bundle:nil];
    [self.navigationController pushViewController:searchFriendsViewController animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
