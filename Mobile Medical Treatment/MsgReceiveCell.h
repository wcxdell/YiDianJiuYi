//
//  MsgReceiveCell.h
//  LXFXMPPDemo
//
//  Created by iObitLXF on 4/26/13.
//  Copyright (c) 2013 iObitLXF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface MsgReceiveCell : UITableViewCell

@property (nonatomic,strong) UILabel *senderAndTimeLabel;
@property (nonatomic,strong) UITextView * messageContentView;
@property (nonatomic,strong) UIImageView * bgImageView;


@end
