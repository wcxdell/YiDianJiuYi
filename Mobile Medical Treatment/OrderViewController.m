//
//  HospitalRegisterViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "OrderViewController.h"
#import "FunctionType.h"
#import "MessageViewController.h"
#import "Patient.h"
#import "PatientTableViewCell.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"预约";
    
    self.topLabel.textAlignment = NSTextAlignmentRight;
    self.topLabel.backgroundColor = [UIColor lightGrayColor];
    self.topLabel.text = @"已有4名用户预约您";
    
    Patient * p1 = [[Patient alloc]init];
    p1.name = @"汪峰";
    p1.detail = @"心脏病";
    p1.sex = YES;
    p1.age = 34;
    
    Patient * p2 = [[Patient alloc]init];
    p2.name = @"章子怡";
    p2.detail = @"心绞痛";
    p2.sex = NO;
    p2.age = 37;
    
    self.type1 = [NSMutableArray arrayWithObjects:p1,p2, nil];
    
    Patient * p3 = [[Patient alloc]init];
    p3.name = @"周杰伦";
    p3.detail = @"脑血栓";
    p3.sex = YES;
    p3.age = 37;
    
    Patient * p4 = [[Patient alloc]init];
    p4.name = @"那英";
    p4.detail = @"脑梗";
    p4.sex = NO;
    p4.age = 40;
    
    self.type2 = [NSMutableArray arrayWithObjects:p3,p4, nil];
    
    _tableData = @{@"2015-08-13":_type1,
                   @"2015-08-14":_type2};
    _stories = [[_tableData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _stories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* story = _stories[section];
    return [_tableData[story] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger sectionNo = indexPath.section;
    NSUInteger rowNo = indexPath.row;
    
    NSString * story = _stories[sectionNo];
    
    static NSString *CellIdentifier = @"Cell";
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[PatientTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.textLabel.font = [UIFont systemFontOfSize:16.0];
//        cell.textLabel.textColor = [UIColor grayColor];
    }
    Patient * item = [[Patient alloc]init];
    item = [_tableData[story] objectAtIndex:rowNo];
    
    cell.nameField.text = item.name;
    cell.age.text = [NSString stringWithFormat:@"%ld",item.age];
    cell.sex.text = @"男";
    cell.sex.textColor = [UIColor blueColor];
    cell.detailFiled.text = item.detail;
    if (item.sex) {
        cell.sex.text = @"男";
        cell.sex.textColor = [UIColor blueColor];
    }else{
        cell.sex.text = @"女";
        cell.sex.textColor = [UIColor redColor];
    }
    cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"blue.png"] toSize:CGSizeMake(40,40)];
    
    
    
    return cell;
}

//-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
////    return _stories[section];
//    return @"123";
//}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle = _stories[section];
    
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.tableView.bounds.size.width, 30.0)];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor whiteColor];
    label.opaque = NO;
    label.highlightedTextColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.frame = CGRectMake(0.0, 0.0, self.tableView.bounds.size.width/2, 30.0);

    label.text = sectionTitle;
    
    UILabel * labelRight = [[UILabel alloc] initWithFrame:CGRectZero];
    labelRight.backgroundColor = [UIColor whiteColor];
    labelRight.opaque = NO;
    labelRight.textAlignment = NSTextAlignmentRight;
    labelRight.highlightedTextColor = [UIColor whiteColor];
    labelRight.font = [UIFont boldSystemFontOfSize:15];
    labelRight.frame = CGRectMake(self.tableView.bounds.size.width/2, 0.0, self.tableView.bounds.size.width/2, 30.0);
    
    labelRight.text = [NSString stringWithFormat:@"预约用户%ld名",[_tableData[sectionTitle] count]];
    
    [customView addSubview:label];
    [customView addSubview:labelRight];
    
//    UIView * sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 200)];
//    [sectionView setBackgroundColor:[UIColor whiteColor]];
//    [sectionView addSubview:label];
    return customView;
}

//-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    NSString* story = _stories[section];
//    return [NSString stringWithFormat:@"一共有%lu个人物",[_tableData[story] count]];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //变色效果   不加上一直是灰色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 70;
}


//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
//    return 30;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 1;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 1)];
//    view.backgroundColor = [UIColor clearColor];
//    return view;
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
