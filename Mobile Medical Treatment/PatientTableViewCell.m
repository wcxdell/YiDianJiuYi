//
//  PatientTableViewCell.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/14.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "PatientTableViewCell.h"

@implementation PatientTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        
        self.nameField = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, 70, 20)];
        self.nameField.textAlignment = NSTextAlignmentLeft;
        self.nameField.font = [UIFont boldSystemFontOfSize:18];
        
        [self.contentView addSubview:self.nameField];
        
        self.age = [[UILabel alloc]initWithFrame:CGRectMake(300, 10, 70, 20)];
        self.nameField.textAlignment = NSTextAlignmentLeft;
        self.nameField.font = [UIFont boldSystemFontOfSize:18];
//        self.age.textColor = [UIColor redColor];
        
        [self.contentView addSubview:self.age];
        
        self.sex = [[UILabel alloc]initWithFrame:CGRectMake(180, 10, 20, 20)];
        self.sex.textAlignment = NSTextAlignmentLeft;
        self.sex.font = [UIFont boldSystemFontOfSize:18];
        
        [self.contentView addSubview:self.sex];
        
        self.detailFiled = [[UILabel alloc]initWithFrame:CGRectMake(70, 35, 70, 20)];
        self.detailFiled.textAlignment = NSTextAlignmentLeft;
        self.detailFiled.font = [UIFont boldSystemFontOfSize:18];
        self.detailFiled.textColor = [UIColor lightGrayColor];
        
        [self.contentView addSubview:self.detailFiled];
    }
    return self;
}

@end
