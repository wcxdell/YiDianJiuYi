//
//  Message.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/21.
//  Copyright (c) 2015年 appel. All rights reserved.
//
//聊天页面的非持久化页面
#import <Foundation/Foundation.h>

typedef enum
{
    MsgType_Receive=0,
    MsgType_Send,
    
}MsgType;

@interface Message : NSObject

@property (nonatomic, copy) NSString *strId;
@property (nonatomic, copy) NSString *strText;
@property (nonatomic, copy) NSString *strUserid;
@property (nonatomic, copy) NSString *strTime;
@property (nonatomic, copy) NSString *strFromUsername;
@property (nonatomic, copy) NSString *strToUsername;
@property (nonatomic, assign)MsgType msgType;

@end
