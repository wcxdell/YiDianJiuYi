//
//  Patient.h
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/15.
//  Copyright (c) 2015年 appel. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Patient : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) BOOL sex;


@end
