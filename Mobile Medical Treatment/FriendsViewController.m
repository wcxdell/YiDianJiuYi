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
#import "AppDelegate.h"
#import "NewFriendsViewController.h"
@interface FriendsViewController ()

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"医圈";
    
    AppDelegate* appDelegate = [self appDelegate];
    appDelegate.friendsListDelegate = self;
    
    self.friendsNew.backgroundColor = [UIColor lightGrayColor];
    
    
    [self passValue];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend:)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
}


-(void) addFriend:(id) sender
{
    SearchFriendsViewController *searchFriendsViewController = [[SearchFriendsViewController alloc]initWithNibName:@"SearchFriendsViewController" bundle:nil];
    [self.navigationController pushViewController:searchFriendsViewController animated:YES];
    
}

-(AppDelegate*) appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.friends.count;
//        return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //        NSLog(@"%ld",row);
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        cell.textLabel.text = self.friends[row];
        cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"blue.png"] toSize:CGSizeMake(40,40)];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(void)passValue{
    AppDelegate * appDelegate = [self appDelegate];
    self.friends = [NSMutableArray arrayWithArray:appDelegate.friends];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //start a Chat
    ChatViewController *chatController = [[ChatViewController alloc]initWithNibName:@"ChatViewController" bundle:nil];
    chatController.chatUser = (NSString *)[self.friends objectAtIndex:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)newFriends:(id)sender {
    NewFriendsViewController *newFriendsViewController = [[NewFriendsViewController alloc]initWithNibName:@"NewFriendsViewController" bundle:nil];
    [self.navigationController pushViewController:newFriendsViewController animated:YES];
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
