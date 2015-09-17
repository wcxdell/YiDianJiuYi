//
//  HospitalRegisterViewController.h
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSDictionary* tableData;

@property(strong,nonatomic) NSArray * stories;
@property (strong, nonatomic) IBOutlet UILabel *topLabel;

@property NSMutableArray * type1;
@property NSMutableArray * type2;

@end
