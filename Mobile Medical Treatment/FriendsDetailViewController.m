//
//  FriendsDetailViewController.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/17.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "FriendsDetailViewController.h"
#import "MessageViewController.h"

@interface FriendsDetailViewController ()

@end

@implementation FriendsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"详细信息";
    self.topView.backgroundColor = [UIColor lightGrayColor];
    
    self.tableView.scrollEnabled = NO;
    
    [_button setTitle:@"添加到通讯录" forState:UIControlStateNormal];
    _button.backgroundColor = [UIColor orangeColor];
    [_button.layer setCornerRadius:4.0];
    [_button.layer setMasksToBounds:YES];
    [_button.layer setBorderWidth:1.0];
    [_button.layer setBorderColor:[UIColor orangeColor].CGColor];
    _button.titleLabel.font = [UIFont systemFontOfSize:20];
    _button.titleLabel.textColor = [UIColor whiteColor];
    
    
    
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80,80)];
    [image setImage:[MessageViewController scale:[UIImage imageNamed:@"blue.png"] toSize:CGSizeMake(80,80)]];
    
    UILabel* nameField = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 70, 20)];
    nameField.textAlignment = NSTextAlignmentLeft;
    nameField.font = [UIFont boldSystemFontOfSize:18];
    nameField.text=@"汪峰";
    
    UILabel* sex = [[UILabel alloc]initWithFrame:CGRectMake(100, 55, 70, 20)];
    sex.textAlignment = NSTextAlignmentLeft;
    sex.font = [UIFont boldSystemFontOfSize:18];
    sex.textColor = [UIColor grayColor];
    sex.text = @"男";
    
    
    [self.topView addSubview:image];
    [self.topView addSubview:nameField];
    [self.topView addSubview:sex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return 4;
    //    return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //        NSLog(@"%ld",row);
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"姓名：";
            break;
        case 1:
            cell.textLabel.text = @"电话：";
            break;
        case 2:
            cell.textLabel.text = @"邮箱：";
            break;
        default:
            cell.textLabel.text = @"签名：";
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
