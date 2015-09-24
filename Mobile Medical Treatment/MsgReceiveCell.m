//
//  MsgReceiveCell.m
//  LXFXMPPDemo
//
//  Created by iObitLXF on 4/26/13.
//  Copyright (c) 2013 iObitLXF. All rights reserved.
//

#import "MsgReceiveCell.h"

#define padding 20

@implementation MsgReceiveCell


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //日期标签
        self.senderAndTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 20)];
        //居中显示
        self.senderAndTimeLabel.textAlignment = NSTextAlignmentCenter;
        self.senderAndTimeLabel.font = [UIFont systemFontOfSize:11.0];
        //文字颜色
        self.senderAndTimeLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.senderAndTimeLabel];
        
        //背景图
        self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.bgImageView];
        
        //聊天信息
        self.messageContentView = [[UITextView alloc] init];
        self.messageContentView.backgroundColor = [UIColor clearColor];
        //不可编辑
        self.messageContentView.editable = NO;
        self.messageContentView.scrollEnabled = NO;
        [self.messageContentView sizeToFit];
        [self.contentView addSubview:self.messageContentView];
        
    }
    return self;
}

@end
