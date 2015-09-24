//
//  HistoryPatientViewController.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/15.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "HistoryPatientViewController.h"
#import "PatientTableViewCell.h"
#import "Patient.h"
#import "MessageViewController.h"

@interface HistoryPatientViewController ()

@end

@implementation HistoryPatientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"历史病人";
    // Do any additional setup after loading the view.
    
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
    
    
    
    
    self.type = [NSMutableArray arrayWithObjects:p1,p2, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.type.count;
    //    return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //        NSLog(@"%ld",row);
        cell = [[PatientTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
        //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //        cell.textLabel.font = [UIFont systemFontOfSize:17.0];
        //        cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        //        FunctionType * item = self.type[row];
        Patient * item = self.type[row];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //变色效果   不加上一直是灰色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
