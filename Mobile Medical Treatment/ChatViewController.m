//
//  ChatViewController.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/21.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "ChatViewController.h"
#import "MessageViewController.h"
#import "MsgReceiveCell.h"
#import "MsgSendCell.h"

#define padding 20

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.chatUser;
    AppDelegate * appDelegate = [self appDelegate];
    appDelegate.messageListDelegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self passMessage];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)keyboardWillShow:(NSNotification *)notification {
    
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat screenHeight = self.view.bounds.size.height;
    __block CGRect frame = self.viewTool.frame;
    
    if (frame.origin.y != screenHeight - keyboardSize.height - 40.) {
        frame.origin.y = screenHeight - keyboardSize.height - 40.;//lxf
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.viewTool.frame = frame;
                             
                         } completion:^(BOOL finished) {
                             self.viewTool.frame = frame;
                         }];
        
    }
}


- (void)keyboardWillHide:(NSNotification *)notification {
    
    
    
    CGFloat screenHeight = self.view.bounds.size.height;
    __block CGRect frame = self.viewTool.frame;
    frame.origin.y = screenHeight- 40;//lxf
    self.viewTool.frame = frame;
    
    //    [UIView animateWithDuration:fAniTimeSecond animations:^{
    //        self.viewItems.frame = frame;
    //    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSLog(@"%ld",self.messages.count);
//    AppDelegate * appDelegate = [self appDelegate];
    
//    AppDelegate * appDelegate = [self appDelegate];
    NSString * strSelf = @"You";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(strFromUsername contains %@ && strToUsername contains %@) ||strFromUsername contains %@",strSelf,self.title,self.title];
    
    
    [self.messages filterUsingPredicate:predicate];
    return self.messages.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate * appDelegate = [self appDelegate];
    Message* mess = [appDelegate.messages objectAtIndex:indexPath.row];
    
    NSString * msg = mess.strText;
    CGSize textSize = {260.0 , 10000.0};
    CGSize size = [msg sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
    
    size.height += padding*2;
    
    CGFloat height = size.height < 65 ? 65 : size.height;
    
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    AppDelegate * appDelegate = [self appDelegate];
    NSString * strSelf = @"You";
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(strFromUsername contains %@ && strToUsername contains %@) ||strFromUsername contains %@",strSelf,self.title,self.title];
    
    [self.messages filterUsingPredicate:predicate];

    Message *mes = [self.messages objectAtIndex:indexPath.row];
    
    CGSize textSize = {260.0 ,10000.0};
    CGSize size = [mes.strText sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:textSize lineBreakMode:UILineBreakModeWordWrap];
    
    size.width +=(padding/2);
    
    UIImage *bgImage = nil;
    
    if (mes.msgType == MsgType_Receive) {
        NSString *CellIdentifier = @"MsgReceiveCell";
        MsgReceiveCell *cell = (MsgReceiveCell *)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[MsgReceiveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        cell.messageContentView.text = mes.strText;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.userInteractionEnabled = NO;
        
        bgImage = [[UIImage imageNamed:@"BlueBubble2.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:15];
        
        
        [cell.messageContentView setFrame:CGRectMake(padding, padding*2, size.width, size.height+padding)];
        
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.frame.origin.x - padding/2, cell.messageContentView.frame.origin.y-padding/2, size.width + padding, size.height + padding)];
        
        
        
        cell.bgImageView.image = bgImage;
        cell.senderAndTimeLabel.text = [NSString stringWithFormat:@"%@ %@", mes.strFromUsername, mes.strTime];
        
        
        
        return cell;
    }
    else if (mes.msgType == MsgType_Send) {
        NSString *CellIdentifier = @"MsgSendCell";
        MsgSendCell *cell = (MsgSendCell *)[tableView  dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            
            cell = [[MsgSendCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.messageContentView.text = mes.strText;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.userInteractionEnabled = NO;
        
        bgImage = [[UIImage imageNamed:@"GreenBubble2.png"] stretchableImageWithLeftCapWidth:14 topCapHeight:15];
        
        
        
        [cell.messageContentView setFrame:CGRectMake(self.view.bounds.size.width-size.width - padding, padding*2, size.width, size.height+padding)];
        
        [cell.bgImageView setFrame:CGRectMake(cell.messageContentView.frame.origin.x - padding/2, cell.messageContentView.frame.origin.y - padding/2, size.width + padding, size.height + padding)];
        
        cell.bgImageView.image = bgImage;
        cell.senderAndTimeLabel.text = [NSString stringWithFormat:@"%@ %@", @"you", mes.strTime];
        return cell;
    }
    return nil;
    
}

-(void)passMessage{
    AppDelegate * appDelegate = [self appDelegate];
    self.messages = [NSMutableArray arrayWithArray:appDelegate.messages];
    [self.tableView reloadData];
}

-(AppDelegate *)appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

//取得当前的XMPPStream
-(XMPPStream *)xmppStream{
    
    return [[self appDelegate] xmppStream];
}

- (IBAction)sendButton:(id)sender {
    
    //本地输入框中的信息
    NSString *message = self.textField.text;
    
    if (message.length > 0) {
        
        //XMPPFramework主要是通过KissXML来生成XML文件
        //生成<body>文档
        NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
        [body setStringValue:message];
        
        //生成XML消息文档
        NSXMLElement *mes = [NSXMLElement elementWithName:@"message"];
        //消息类型
        [mes addAttributeWithName:@"type" stringValue:@"chat"];
        //发送给谁
        [mes addAttributeWithName:@"to" stringValue:self.chatUser];
        //由谁发送
        [mes addAttributeWithName:@"from" stringValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"1@127.0.0.1"]];
        //组合
        [mes addChild:body];
        
        //发送消息
        [[self xmppStream] sendElement:mes];
        
        self.textField.text = @"";
        [self.textField resignFirstResponder];
        
        Message *mess = [[Message alloc]init];
        mess.strText = message;
        mess.strFromUsername = @"You";
        mess.strToUsername = self.chatUser;
        mess.msgType = MsgType_Send;
        NSString *strTime = [Static getCurrentTime];
        mess.strTime = strTime;
        
        [self.messages addObject:mess];
        
        AppDelegate * appDelegate = [self appDelegate];
        [appDelegate.messages addObject:mess];
        
        //重新刷新tableView
        [self.tableView reloadData];
        
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

@end
