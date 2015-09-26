//
//  FirstPageViewController.h
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FunctionType.h"

@interface MessageViewController : UIViewController

@property(nonatomic,strong) NSMutableArray * friends;

+ (UIImage *)scale:(UIImage *)image toSize:(CGSize)size;

@end
