//
//  SearchFriendsViewController.m
//  Mobile Medical Treatment
//
//  Created by 王长旭 on 15/9/17.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "SearchFriendsViewController.h"
#import "Patient.h"
#import "MessageViewController.h"
#import "FriendsDetailViewController.h"

@interface SearchFriendsViewController ()

@end

@implementation SearchFriendsViewController{
    BOOL isSearch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"搜索好友";
    isSearch = NO;
    _searchBar.delegate = self;
    _searchBar.showsCancelButton = YES;
    
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
    
    self.friends = [NSMutableArray arrayWithObjects:p1,p2, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

        if (isSearch) {
            return self.searchFriends.count;
        }else{
            return 0;
        }
    //    return [self.functionType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
            //        NSLog(@"%ld",row);
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Patient * item = [[Patient alloc]init];;
    if (isSearch) {
        item = self.searchFriends[row];
        cell.textLabel.text = item.name;
        cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"default_icon.png"] toSize:CGSizeMake(40,40)];
    }else{
//        item = self.friends[row];
    }
        
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //变色效果   不加上一直是灰色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FriendsDetailViewController * friendsDetailViewController = [[FriendsDetailViewController alloc]initWithNibName:@"FriendsDetailViewController" bundle:nil];
    [self.navigationController pushViewController:friendsDetailViewController animated:YES];
    
}

-(void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self filterBySubstring:searchText];
}

-(void) searchBarSearchButtonClicked:(UISearchBar*)searchBar{
    [self filterBySubstring:self.searchBar.text];
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
}


-(void)filterBySubstring:(NSString*)subStr{
    isSearch = YES;
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[c] %@",subStr];
    
    //    _searchType = [_type filterUsingPredicate:pred];
    self.searchFriends = [NSMutableArray arrayWithArray:self.friends];
    [self.searchFriends filterUsingPredicate:pred];
    [self.tableView reloadData];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void)searchBarCancelButtonClicked:(UISearchBar * )searchBar{
    isSearch = NO;
    [self.tableView reloadData];
    [self.searchBar resignFirstResponder];
    self.searchBar.text = @"";
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
