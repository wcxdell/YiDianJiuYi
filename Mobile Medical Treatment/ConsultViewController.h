//
//  ConsultViewController.h
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UITableView *topTableView;

@property (strong, nonatomic) IBOutlet UITableView *bottomTableView;

@property NSMutableArray * type;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property  NSMutableArray * searchType;


@end
