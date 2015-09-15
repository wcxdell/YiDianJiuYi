//
//  HospitalRegisterViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "HospitalRegisterViewController.h"
#import "FunctionType.h"
#import "MessageViewController.h"

@interface HospitalRegisterViewController ()

@end

@implementation HospitalRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"预约";
    
    FunctionType *type1 = [[FunctionType alloc]init];
    type1.name = @"请选择医院";
    type1.image = [UIImage imageNamed:@"guahao_yiyuan_icon"];
    
    FunctionType *type2 = [[FunctionType alloc]init];
    type2.name = @"请选择科室";
    type2.image = [UIImage imageNamed:@"guahao_keshi_icon"];
    
    self.functionType = [NSMutableArray arrayWithObjects:type1, type2, nil];
    
    _button.layer.cornerRadius = 5.0;
    _button.layer.borderWidth = 1.0;
    _button.layer.borderColor = _button.backgroundColor.CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:16.0];
        cell.textLabel.textColor = [UIColor grayColor];
    }
    
    FunctionType *item = [self.functionType objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    cell.imageView.image = [MessageViewController scale:item.image toSize:CGSizeMake(30, 45)];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goToRegister:(id)sender {
}
@end
