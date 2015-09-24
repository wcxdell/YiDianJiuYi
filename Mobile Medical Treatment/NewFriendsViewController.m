//
//  NewFriendsViewController.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/23.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "NewFriendsViewController.h"
#import "MessageViewController.h"

@interface NewFriendsViewController ()

@end

@implementation NewFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"新的朋友";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    //        return [self.functionType count];
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
    cell.textLabel.text = @"123";
    cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"blue.png"] toSize:CGSizeMake(40,40)];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
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
