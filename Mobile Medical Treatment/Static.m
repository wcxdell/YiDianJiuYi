//
//  Static.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/21.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "Static.h"

@implementation Static

+(NSString *)getCurrentTime{
    
    NSDate *nowUTC = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    return [dateFormatter stringFromDate:nowUTC];
    
}

@end
