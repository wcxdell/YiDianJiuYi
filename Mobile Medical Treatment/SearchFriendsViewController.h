//
//  SearchFriendsViewController.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/17.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchFriendsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray * friends;
@property NSMutableArray * searchFriends;
@end
