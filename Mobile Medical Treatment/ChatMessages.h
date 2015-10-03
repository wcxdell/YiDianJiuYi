//
//  ChatMessages.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/30.
//  Copyright (c) 2015年 appel. All rights reserved.
//
//数据库对象
#import <Foundation/Foundation.h>

@interface ChatMessages : NSObject
@property (nonatomic,strong) NSString * name;
@property (nonatomic,strong) NSString * message;
//我发送的是0   接受的是1   字符串类型
@property NSString* type;
@property (nonatomic,strong) NSDate * time;
@property NSData * image;
@property (nonatomic,strong) NSString * strTime;

@end
