//
//  Static.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/21.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <Foundation/Foundation.h>

//NSString *const CSERVER = @"127.0.0.1";
//NSString *const CUSERID = @"userID";
//NSString *const CPASSWORD = @"passWord";
#define USERID @"userId"
#define PASSWORD @"passWord"
#define SERVER @"123.57.191.21"
#define HOSTNAME @"123.57.192.21"
//#define SERVER @"127.0.0.1"
//#define SERVER @"www.test.com"

@interface Static : NSObject

+(NSString *)getCurrentTime;

@end
