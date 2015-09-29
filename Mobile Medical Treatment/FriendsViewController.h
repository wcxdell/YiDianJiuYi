//
//  FriendsViewController.h
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ChatViewController.h"
@interface FriendsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,FriendsListDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray* friends;
@property (strong, nonatomic) IBOutlet UIControl *friendsNew;
@property (nonatomic,strong) NSMutableDictionary * dicFriends;
@property(strong,nonatomic) NSArray * stories;

@end
