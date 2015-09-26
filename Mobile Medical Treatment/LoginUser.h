//
//  LoginUser.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/26.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * userName;
static NSString * jid;

@interface LoginUser : NSObject
+(NSString*) userName;
+(void) setUserName:(NSString*)user;
+(NSString*) jid;
+(void)setJid:(NSString*)jjid;

@end
