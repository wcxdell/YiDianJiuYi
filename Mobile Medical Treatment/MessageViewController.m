//
//  FirstPageViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "MessageViewController.h"
#import "AppDelegate.h"
#import "Friend.h"
#import "ChatMessages.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"消息";

}


- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [_timer invalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

-(AppDelegate * )appDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(XMPPRoster*) xmppRoster{
    return [[self appDelegate] xmppRoster];
}

- (IBAction)addFriends:(id)sender {
    
    AppDelegate* appDelegate = [self appDelegate];
    NSMutableArray * friends = [NSMutableArray arrayWithArray:appDelegate.friends];
    XMPPJID *jid = [XMPPJID jidWithString:@"3@127.0.0.1"];
    if([friends indexOfObject:@"3@127.0.0.1"]!=NSNotFound){
        NSLog(@"已经是好友了");
    }else{
        NSLog(@"不是好友");
    }
    
    XMPPRoster * xmppRoster = [self xmppRoster];
    [xmppRoster subscribePresenceToUser:jid];
}
- (IBAction)addEntity:(id)sender {
    //add
//    ChatMessages * mes = [NSEntityDescription insertNewObjectForEntityForName:@"ChatMessage" inManagedObjectContext:self.appDelegate.managedObjectContext];
//    mes.name = @"123";
//    
//    NSError * error = nil;
//    
//        if([self.appDelegate.managedObjectContext save:&error]){
//            [[[UIActionSheet alloc] initWithTitle:@"保存成功" delegate:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil] showInView:self.view];
//        }else{
//            [[[UIActionSheet alloc] initWithTitle:@"保存失败" delegate:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil] showInView:self.view];
//        }
    
    
    [self fetch];
    
}
//fetch
-(void)fetch{
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"ChatMessage" inManagedObjectContext:self.appDelegate.managedObjectContext];
    [request setEntity:entity];
    
    NSError* error = nil;
    self.messages = [[self.appDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    ChatMessages * oc;
    for(oc in self.messages){
        NSLog(@"用户名：%@",oc.name);
        NSLog(@"发送时间：%@",oc.strTime);
        NSLog(@"接受到的信息：%@",oc.type);
        NSLog(@"发送的消息：%@",oc.message);
//        [self.appDelegate.managedObjectContext delete:oc];
//        NSError * error;
//        if(![self.appDelegate.managedObjectContext save:&error]){
//            NSLog(@"删除出错:%@   %@",error,[error userInfo]);
//        }
    }
    
    
}

- (IBAction)deleteObject:(id)sender {
    ChatMessages * oc;
    for(oc in self.messages){
        [self.appDelegate.managedObjectContext deleteObject:oc];
        NSError * error;
        if(![self.appDelegate.managedObjectContext save:&error]){
            NSLog(@"删除出错");
        }
        
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
