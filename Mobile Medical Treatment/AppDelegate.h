//
//  AppDelegate.h
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BMapKit.h"
#import "XMPP.h"
#import "Message.h"
#import "Static.h"

//定义颜色
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@protocol FriendsListDelegate;

@protocol MessageListDelegate;


@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    XMPPStream      *xmppStream;
    NSString        *password;
    BOOL            isOpen;
    NSMutableArray * friends;
}



//typedef void (^UserListNewFriendsOnlineBlock)(NSString *aStr);
//typedef void (^UserListFriendsWentOfflineBlock)(NSString *aStr);

@property (strong, nonatomic) id<FriendsListDelegate> friendsListDelegate;
@property (strong, nonatomic) id<MessageListDelegate> messageListDelegate;

//@property(nonatomic,strong) UserListNewFriendsOnlineBlock userListNewFriendsOnlineBlock;
//@property(nonatomic,strong) UserListFriendsWentOfflineBlock userListFriendsWentOfflineBlock;


@property (nonatomic,readonly)XMPPStream * xmppStream;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBar;

@property (nonatomic,strong) NSMutableArray * friends;

@property (nonatomic,strong)NSMutableArray * messages;

- (UITabBarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;
- (void)loginSuccessfulCompleteBlock:(void (^) (void))block;
- (void)fillViews:(NSInteger)i;

//是否连接
-(BOOL)connect;

//断开连接
-(void)disconnect;

//设置xmppStream
-(void)setupStream;

//上线
-(void)goOnline;

//下线
-(void)goOffline;



//-(void)setUserListBlocks:(UserListNewFriendsOnlineBlock )block1 otherBlock:(UserListFriendsWentOfflineBlock)block2;

@end

@protocol FriendsListDelegate <NSObject>
-(void)passValue;
@end

@protocol MessageListDelegate <NSObject>

-(void) passMessage;

@end