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
#import "Friend.h"
#import "LoginUser.h"


@interface AppDelegate ()

@end

//BMKMapManager* _mapManager;

@implementation AppDelegate

@synthesize xmppStream;
@synthesize friends;
@synthesize xmppRoster;
@synthesize xmppRosterCoreDataStorage;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    xmppRoster.autoAcceptKnownPresenceSubscriptionRequests = NO;
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
//    [self queryRoster];
    
    
//    xmppRoster.autoAcceptKnownPresenceSubscriptionRequests = YES;
    
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
//    [self connect];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
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
    if(xmppRosterCoreDataStorage){
        xmppRoster = [[XMPPRoster alloc] initWithRosterStorage:xmppRosterCoreDataStorage];
    }else{
        xmppRosterCoreDataStorage = [[XMPPRosterCoreDataStorage alloc]init];
        xmppRoster = [[XMPPRoster alloc] initWithRosterStorage:xmppRosterCoreDataStorage];
    }
//    [xmppRoster fetchRoster];
    
}

- (void)goOnline {
    XMPPPresence *presence = [XMPPPresence presence];
    [[self xmppStream] sendElement:presence];
}

- (void)goOffline {
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"unavailable"];
    [[self xmppStream] sendElement:presence];
}

- (BOOL)connect{
    
    [self setupStream];
    
    
        NSString *jabberID = [[NSUserDefaults standardUserDefaults] stringForKey:USERID];
    [LoginUser setUserName:jabberID];
    jabberID = [NSString stringWithFormat:@"%@@%@",jabberID,SERVER];
    [LoginUser setJid:jabberID];
        NSString *myPassword = [[NSUserDefaults standardUserDefaults] stringForKey:PASSWORD];
    
    
    if (![xmppStream isDisconnected]) {
        return YES;
    }
    
    [xmppStream setMyJID:[XMPPJID jidWithString:jabberID]];
    [xmppStream setHostName:SERVER];
    password = myPassword;
    
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
    [xmppRoster activate:xmppStream];
    [xmppRoster addDelegate:self delegateQueue:dispatch_get_main_queue()];
    [self loginSuccessfulCompleteBlock:{}];
    [xmppRoster fetchRoster];
}
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"登陆失败" message:@"用户名密码错误" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

//接收好友状态
- (void)xmppStream:(XMPPStream *)sender didReceivePresence:(XMPPPresence *)presence{
    
    
    if ([[presence type] isEqualToString:@"subscribe"])
    {// Presence subscription request from someone who's NOT in our roster
            
        [self didReceivePresenceSubscriptionRequest:presence];
    }
    else{
    
    NSLog(@"presence = %@", presence);
        
        Friend * doctorFriend = [[Friend alloc]init];
        doctorFriend.first = NO;
    
    //取得好友状态
    doctorFriend.presenceType = [presence type]; //online/offline
    //当前用户
    NSString *userId = [[sender myJID] user];
        userId = [NSString stringWithFormat:@"%@@%@",userId,SERVER];
    //在线用户
    doctorFriend.name = [[presence from] user];
        doctorFriend.name = [NSString stringWithFormat:@"%@@%@",doctorFriend.name,SERVER];
    
    NSLog(@"在线好友为：%@",doctorFriend.name);
    
    if (![doctorFriend.name isEqualToString:userId]) {
        
        //在线状态
        if ([doctorFriend.presenceType isEqualToString:@"available"]) {
            
            [self newFriendsOnline:doctorFriend];
            [self.friendsListDelegate passValue];
            
        }else if ([doctorFriend.presenceType isEqualToString:@"unavailable"]) {

            [self newFriendsOnline:doctorFriend];
            [self.friendsListDelegate passValue];
        }
        
    }
    }
    
}

//在线好友
-(void)newFriendsOnline:(Friend *)doctorFriend{
    
//    if (![self.friends containsObject:doctorFriend]) {
//        [self.friends addObject:doctorFriend];
//    }
    BOOL flag = NO;
    for (int i=0; i<self.friends.count; i++) {
        Friend * dFriend = [self.friends objectAtIndex:i];
        if([dFriend.name isEqualToString:doctorFriend.name]){
            if (!doctorFriend.first) {
            [self.friends replaceObjectAtIndex:i withObject:doctorFriend];
            
            }
            flag = YES;
        }
    }
    if(!flag){
        [self.friends addObject:doctorFriend];
    }
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

- (void)didReceivePresenceSubscriptionRequest:(XMPPPresence *)presence
{
    //取得好友状态
    NSString *presenceType = [NSString stringWithFormat:@"%@", [presence type]]; //online/offline
    //请求的用户
    NSString *presenceFromUser =[NSString stringWithFormat:@"%@", [[presence from] user]];
    NSLog(@"presenceType:%@",presenceType);
    
    NSLog(@"111111111");
    
    XMPPJID *jid = [XMPPJID jidWithString:[NSString stringWithFormat:@"%@@%@", presenceFromUser,SERVER]];
    [xmppRoster acceptPresenceSubscriptionRequestFrom:jid andAddToRoster:YES];
//    [xmppRoster rejectPresenceSubscriptionRequestFrom:jid];
    
}


//getRoster
- (BOOL)xmppStream:(XMPPStream *)sender didReceiveIQ:(XMPPIQ *)iq {
    if ([@"result" isEqualToString:iq.type]) {
        NSXMLElement *query = iq.childElement;
        if ([@"query" isEqualToString:query.name]) {
            NSArray *items = [query children];
            
            for (NSXMLElement *item in items) {
                NSString *jid = [item attributeStringValueForName:@"jid"];
                Friend * doctorFriend = [[Friend alloc]init];
                doctorFriend.first = YES;
                doctorFriend.name = jid;
                doctorFriend.presenceType = @"unavailable";
                [self newFriendsOnline:doctorFriend];
                
            }
        }
    }
    return YES;
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "wcx.noteBook" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Medical" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Medical.sqlite"];
    //    NSLog(@"%@",storeURL);
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
