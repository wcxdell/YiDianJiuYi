//
//  ConsultViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "ConsultViewController.h"
#import "MessageViewController.h"
#import "PatientTableViewCell.h"
#import "HistoryPatientViewController.h"
#import "Patient.h"

@interface ConsultViewController ()

@end

@implementation ConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"咨询";
    
    _topTableView.delegate = self;
    _topTableView.dataSource = self;
    _topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _topTableView.scrollEnabled = NO;
//    _topTableView.tableFooterView = [[UIView alloc]init];
    
    _bottomTableView.delegate = self;
    _bottomTableView.dataSource = self;
    
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

//- (void) viewDidAppear:(BOOL)animated{
//    _bottomTableView.frame = CGRectMake(_bottomTableView.frame.origin.x, _bottomTableView.frame.origin.y, _bottomTableView.frame.size.height, [UIScreen mainScreen].bounds.size.width);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:_topTableView]) {
        return 1;
    }
    else if ([tableView isEqual:_bottomTableView]){
//        NSLog(@"数组%ld",_type.count);
        return self.type.count;
    }
    else{
        return 0;
    }
//    return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView isEqual:_topTableView])
    {
//        NSLog(@"%ld",indexPath.row);
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:17.0];
            cell.textLabel.text = @"历史病人";
                cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"blue.png"] toSize:CGSizeMake(40,40)];
        return cell;
    }
    else if([tableView isEqual:_bottomTableView])
    {
        NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    PatientTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
//        NSLog(@"%ld",row);
        cell = [[PatientTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
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
    }
        return cell;
    }
    else
    {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:_topTableView]) {
        return _topTableView.frame.size.height;
    }
    else
    {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //变色效果   不加上一直是灰色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([tableView isEqual:_topTableView]){
        HistoryPatientViewController * historyPatientViewController = [[HistoryPatientViewController alloc]initWithNibName:@"HistoryPatientViewController" bundle:nil];
        [self.navigationController pushViewController:historyPatientViewController animated:YES];
    }
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
