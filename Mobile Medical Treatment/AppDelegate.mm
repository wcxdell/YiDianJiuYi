//
//  AppDelegate.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MessageViewController.h"
#import "OrderViewController.h"
#import "ConsultViewController.h"
#import "FriendsViewController.h"
#import "AboutMyViewController.h"

NSString *const SERVER = @"127.0.0.1";

@interface AppDelegate ()

@end

//BMKMapManager* _mapManager;

@implementation AppDelegate

@synthesize xmppStream;
@synthesize friends;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    LoginViewController *loginViewController = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    self.navigationController = [[UINavigationController alloc]initWithRootViewController:loginViewController];
    self.window.rootViewController = self.navigationController;
    
    self.friends = [NSMutableArray array];
    self.messages = [NSMutableArray array];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"blue.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, 11, 0)]  //????????
                                       forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor],
                                                           UITextAttributeFont:[UIFont systemFontOfSize:19]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_background"]];
//    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tab_selected_background"]];//????
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [[UITabBar appearance] setSelectedImageTintColor:RGBACOLOR(0, 181, 255, 1.0)];
    }
    //[[UITabBarItem appearance] setTitleTextAttributes:@{UITextAttributeTextColor:RGBACOLOR(20, 153, 227, 1.0)} forState:UIControlStateSelected];
    [[UITableView appearance] setSectionIndexColor:RGBACOLOR(0, 181, 255, 1.0)];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        [[UITableView appearance] setSectionIndexBackgroundColor:[UIColor clearColor]];
    }
    
//    // 要使用百度地图，请先启动BaiduMapManager
//    _mapManager = [[BMKMapManager alloc]init];
//    BOOL ret = [_mapManager start:@"bqM3gbKuMjZ0sb9WL10231QL" generalDelegate:self];
//    if (!ret) {
//        NSLog(@"manager start failed!");
//    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self disconnect];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self connect];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UITabBarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UITabBarItem *tabBarItem = nil;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >=7) {
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];  //这两个地方一定要加上
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    } else {
        tabBarItem = [[UITabBarItem alloc] init];
        [tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:image];
    }
    return tabBarItem;
}

- (void)loginSuccessfulCompleteBlock:(void (^) (void))block
{
    [self fillViews:0];
}

- (void)fillViews:(NSInteger)i
{
    //根界面
    if (!_tabBar) {
        _tabBar = [[UITabBarController alloc] init];
    }
    
    float tabbarHeight = _tabBar.tabBar.frame.size.height - 17;
    UIImage *Image1_1 = [self reSizeImage:[UIImage imageNamed:@"news_white2.png"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UIImage *Image1_2 = [self reSizeImage:[UIImage imageNamed:@"news_focus.jpg"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UINavigationController *first = [[UINavigationController alloc] initWithRootViewController:[[MessageViewController alloc] initWithNibName:@"MessageViewController" bundle:nil]];
    first.tabBarItem = [self itemWithTitle:@"消息" image:Image1_1 selectedImage:Image1_2];
    
    UIImage *Image3_1 = [self reSizeImage:[UIImage imageNamed:@"ask_white"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UIImage *Image3_2 = [self reSizeImage:[UIImage imageNamed:@"ask_blue"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UINavigationController *second = [[UINavigationController alloc] initWithRootViewController:[[ConsultViewController alloc] initWithNibName:@"ConsultViewController" bundle:nil]];
    second.tabBarItem = [self itemWithTitle:@"咨询" image:Image3_1 selectedImage:Image3_2];
    
    UIImage *Image2_1 = [self reSizeImage:[UIImage imageNamed:@"btn_adrpre.jpg"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UIImage *Image2_2 = [self reSizeImage:[UIImage imageNamed:@"yuyue_blue.png"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UINavigationController *three = [[UINavigationController alloc] initWithRootViewController:[[OrderViewController alloc] initWithNibName:@"OrderViewController" bundle:nil]];
    three.tabBarItem = [self itemWithTitle:@"预约" image:Image2_1 selectedImage:Image2_2];
    
    UIImage *Image4_1 = [self reSizeImage:[UIImage imageNamed:@"friend_gray"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UIImage *Image4_2 = [self reSizeImage:[UIImage imageNamed:@"friend_green"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UINavigationController *four = [[UINavigationController alloc] initWithRootViewController:[[FriendsViewController alloc] initWithNibName:@"FriendsViewController" bundle:nil]];
    four.tabBarItem = [self itemWithTitle:@"医圈" image:Image4_1 selectedImage:Image4_2];
    
    UIImage *Image5_1 = [self reSizeImage:[UIImage imageNamed:@"me_white"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UIImage *Image5_2 = [self reSizeImage:[UIImage imageNamed:@"me_blue"] toSize:CGSizeMake(tabbarHeight, tabbarHeight)];
    UINavigationController *five = [[UINavigationController alloc] initWithRootViewController:[[AboutMyViewController alloc] initWithNibName:@"AboutMyViewController" bundle:nil]];
    five.tabBarItem = [self itemWithTitle:@"我的" image:Image5_1 selectedImage:Image5_2];
    
    //[_tabBar.tabBarItem setImageInsets:UIEdgeInsetsMake(10, 0, -10, 0)];
    [_tabBar setViewControllers:@[first, second, three, four, five]];
    [_tabBar setSelectedIndex:i];
    [self.window setRootViewController:_tabBar];
    
}

- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize

{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}


//-(void)setUserListBlocks:(UserListNewFriendsOnlineBlock )block1 otherBlock:(UserListFriendsWentOfflineBlock)block2
//{
//    self.userListNewFriendsOnlineBlock = block1;
//    self.userListFriendsWentOfflineBlock = block2;
//}

-(void)setupStream
{
    xmppStream = [[XMPPStream alloc]init];
    [xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    
}

- (void)goOnline {
    XMPPPresence *presence = [XMPPPresence presence];
    [[self xmppStream] sendElement:presence];
}

- (void)goOffline {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [[self xmppStream] sendElement:presence];
}

- (BOOL)connect {
    
    [self setupStream];
    
    //    [[NSUserDefaults standardUserDefaults] setObject:@"5@127.0.0.1" forKey:@"userID"];
    //    [[NSUserDefaults standardUserDefaults] setObject:@"5" forKey:@"userPassword"];
    //
    //    NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:@"userID"];
    //    NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:@"userPassword"];
    
    
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    
    //    if (jabberID == nil || myPassword == nil) {
    //
    //        return NO;
    //    }
    
    [xmppStream setMyJID:[XMPPJID jidWithString:@"1@127.0.0.1"]];
    [xmppStream setHostName:@"127.0.0.1"];
    password = @"1";
    
    NSError *error = nil;
    if (![xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error])
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:[NSString stringWithFormat:@"Can't connect to server %@", [error localizedDescription]]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        
        return NO;
    }
    
    return YES;
}

- (void)disconnect
{
    [self goOffline];
    [xmppStream disconnect];
}



- (void)xmppStreamDidConnect:(XMPPStream *)sender{
    
    isOpen = YES;
    NSError *error = nil;
    //验证密码
    [[self xmppStream] authenticateWithPassword:password error:&error];
    
}

- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    
    [self goOnline];
}

//接收好友状态
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence{
    
    NSLog(@"presence = %@", presence);
    
    //取得好友状态
    NSString *presenceType = [presence type]; //online/offline
    //当前用户
    NSString *userId = [[sender myJID] user];
    //在线用户
    NSString *presenceFromUser = [[presence from] user];
    
    NSLog(@"在线好友为：%@",presenceFromUser);
    
    if (![presenceFromUser isEqualToString:userId]) {
        
        //在线状态
        if ([presenceType isEqualToString:@"available"]) {
            
            [self newFriendsOnline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, SERVER]];
            [self.friendsListDelegate passValue];
            
        }else if ([presenceType isEqualToString:@"unavailable"]) {

            [self friendsWentOffline:[NSString stringWithFormat:@"%@@%@", presenceFromUser, SERVER]];
            [self.friendsListDelegate passValue];
        }
        
    }
    
}

//在线好友
-(void)newFriendsOnline:(NSString *)friendName{
    
    if (![self.friends containsObject:friendName]) {
        [self.friends addObject:friendName];
    }
}

//好友下线
-(void)friendsWentOffline:(NSString *)friendName{
    
    [self.friends removeObject:friendName];
}

//收到消息
- (void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message{
    
//    NSLog(@"message = %@", message);
    
    NSString *idStr = [[message attributeForName:@"id"] stringValue];
    NSString *msg = [[message elementForName:@"body"] stringValue];
    NSString *from = [[message attributeForName:@"from"] stringValue];
    NSString *to = [[message attributeForName:@"to"] stringValue];
    NSString *strTime = [Static getCurrentTime];
    
    if (msg && from) {
        Message *mes = [[Message alloc]init];
        mes.strId = idStr;
        mes.strText = msg;
        mes.strFromUsername = from;
        mes.strToUsername = to;
        mes.msgType = MsgType_Receive;
        mes.strTime = strTime;

        [self newMessageReceived:mes];
        [self.messageListDelegate passMessage];
        
    }
    
}

-(void)newMessageReceived:(Message *)mes{
    
    [self.messages addObject:mes];
    
}


@end
