//
//  ChatViewController.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/21.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Message.h"
#import "Static.h"
@interface ChatViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,MessageListDelegate>

@property(nonatomic,strong) NSString * chatUser;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *viewTool;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong,nonatomic) NSMutableArray * messages;

@end
