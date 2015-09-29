//
//  FriendsViewController.m
//  Mobile Medical Treatment
//
//  Created by appel on 15/9/6.
//  Copyright (c) 2015年 appel. All rights reserved.
//

#import "FriendsViewController.h"
#import "MessageViewController.h"
#import "SearchFriendsViewController.h"
#import "AppDelegate.h"
#import "NewFriendsViewController.h"
#import "Friend.h"
#import "pinyin.h"
@interface FriendsViewController ()

@end

@implementation FriendsViewController{
    NSMutableArray * typeA;
    NSMutableArray * typeB;
    NSMutableArray * typeC;
    NSMutableArray * typeD;
    NSMutableArray * typeE;
    NSMutableArray * typeF;
    NSMutableArray * typeG;
    NSMutableArray * typeH;
    NSMutableArray * typeI;
    NSMutableArray * typeJ;
    NSMutableArray * typeK;
    NSMutableArray * typeL;
    NSMutableArray * typeM;
    NSMutableArray * typeN;
    NSMutableArray * typeO;
    NSMutableArray * typeP;
    NSMutableArray * typeQ;
    NSMutableArray * typeR;
    NSMutableArray * typeS;
    NSMutableArray * typeT;
    NSMutableArray * typeU;
    NSMutableArray * typeV;
    NSMutableArray * typeW;
    NSMutableArray * typeX;
    NSMutableArray * typeY;
    NSMutableArray * typeZ;
    NSMutableArray * typeOT;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"医圈";
    
    AppDelegate* appDelegate = [self appDelegate];
    appDelegate.friendsListDelegate = self;
    
    self.friendsNew.backgroundColor = [UIColor whiteColor];
    
    typeA = [NSMutableArray array];
    typeB = [NSMutableArray array];
    typeC = [NSMutableArray array];
    typeD = [NSMutableArray array];
    typeE = [NSMutableArray array];
    typeF = [NSMutableArray array];
    typeG = [NSMutableArray array];
    typeH = [NSMutableArray array];
    typeI = [NSMutableArray array];
    typeJ = [NSMutableArray array];
    typeK = [NSMutableArray array];
    typeL = [NSMutableArray array];
    typeM = [NSMutableArray array];
    typeN = [NSMutableArray array];
    typeO = [NSMutableArray array];
    typeP = [NSMutableArray array];
    typeQ = [NSMutableArray array];
    typeR = [NSMutableArray array];
    typeS = [NSMutableArray array];
    typeT = [NSMutableArray array];
    typeU = [NSMutableArray array];
    typeV = [NSMutableArray array];
    typeW = [NSMutableArray array];
    typeX = [NSMutableArray array];
    typeY = [NSMutableArray array];
    typeZ = [NSMutableArray array];
    typeOT = [NSMutableArray array];
//    Friend * friend1 = [[Friend alloc]init];
//    friend1.name = @"王长旭";
//    Friend * friend2 = [[Friend alloc]init];
//    friend2.name = @"大好人";
//    Friend * friend3 = [[Friend alloc]init];
//    friend3.name = @"123";
//    Friend * friend4 = [[Friend alloc]init];
//    friend4.name = @"搜到";
//    Friend * friend5 = [[Friend alloc]init];
//    friend5.name = @"哦片";
//    Friend * friend6 = [[Friend alloc]init];
//    friend6.name = @"脾胃";
//    Friend * friend7 = [[Friend alloc]init];
//    friend7.name = @"哟谁";
//    Friend * friend8 = [[Friend alloc]init];
//    friend8.name = @"企鹅";
//    Friend * friend9 = [[Friend alloc]init];
//    friend9.name = @"企鹅asd";
    
//    NSMutableArray * fff = [[NSMutableArray alloc] initWithObjects:friend1,friend2,friend3,friend4,friend5,friend6,friend7,friend8,friend9, nil];
    [self groupedFriends:appDelegate.friends];
//    [self groupedFriends:fff];
    self.dicFriends = [NSMutableDictionary dictionaryWithCapacity:5];
    [self addToDictionary];
    
    self.stories = [self.dicFriends allKeys];
    
    
    [self passValue];
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend:)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
}
//判断是否是中文
-(BOOL)IsChinese:(NSString *) str
{
        int a = [str characterAtIndex:0];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
}



-(void) addFriend:(id) sender
{
    SearchFriendsViewController *searchFriendsViewController = [[SearchFriendsViewController alloc]initWithNibName:@"SearchFriendsViewController" bundle:nil];
    [self.navigationController pushViewController:searchFriendsViewController animated:YES];
    
}

-(AppDelegate*) appDelegate{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}


-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return _stories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* story = _stories[section];
    return [self.dicFriends[story] count];
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    AppDelegate * appDelegate = [self appDelegate];
//    return appDelegate.friends.count;
////        return [self.functionType count];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger sectionNo = indexPath.section;
    NSUInteger rowNo = indexPath.row;
    
    NSString * story = _stories[sectionNo];
    
    AppDelegate * appDelegate = [self appDelegate];
//    NSInteger row = indexPath.row;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        //        NSLog(@"%ld",row);
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Friend * doctorFriend = [[Friend alloc]init];
//    doctorFriend = appDelegate.friends[row];
    doctorFriend = [self.dicFriends[story] objectAtIndex:rowNo];
    
        cell.textLabel.text = doctorFriend.name;
        cell.imageView.image = [MessageViewController scale:[UIImage imageNamed:@"default_icon.png"] toSize:CGSizeMake(40,40)];
    cell.detailTextLabel.text = doctorFriend.presenceType;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


-(void)passValue{
//    AppDelegate * appDelegate = [self appDelegate];
//    self.friends = [NSMutableArray arrayWithArray:appDelegate.friends];
    [self.tableView reloadData];
}

-(NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section{
    return _stories[section];
//    return @"123";
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}

-(NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _stories;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString * story = self.stories[indexPath.section];
    
    //start a Chat
//    AppDelegate * appDelegate = [self appDelegate];
    ChatViewController *chatController = [[ChatViewController alloc]initWithNibName:@"ChatViewController" bundle:nil];
    Friend * doctorFriend = [[Friend alloc]init];
    doctorFriend = [self.dicFriends[story] objectAtIndex:indexPath.row];
    chatController.chatUser = doctorFriend.name;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}


- (IBAction)newFriends:(id)sender {
    NewFriendsViewController *newFriendsViewController = [[NewFriendsViewController alloc]initWithNibName:@"NewFriendsViewController" bundle:nil];
    [self.navigationController pushViewController:newFriendsViewController animated:YES];
}

-(void) groupedFriends:(NSMutableArray *) friends{
    for (Friend * doctorFriend in friends) {
        char a;
        if([self IsChinese:doctorFriend.name])
        {
            a = pinyinFirstLetter([doctorFriend.name characterAtIndex:0]);
        }else{
            a = [doctorFriend.name characterAtIndex:0];
        }
        switch (a) {
            case 'a':
                [typeA addObject:doctorFriend];
                break;
            case 'b':
                [typeB addObject:doctorFriend];
                break;
            case 'c':
                [typeC addObject:doctorFriend];
                break;
            case 'd':
                [typeD addObject:doctorFriend];
                break;
            case 'e':
                [typeE addObject:doctorFriend];
                break;
            case 'f':
                [typeF addObject:doctorFriend];
                break;
            case 'g':
                [typeG addObject:doctorFriend];
                break;
            case 'h':
                [typeH addObject:doctorFriend];
                break;
            case 'i':
                [typeI addObject:doctorFriend];
                break;
            case 'j':
                [typeJ addObject:doctorFriend];
                break;
            case 'k':
                [typeK addObject:doctorFriend];
                break;
            case 'l':
                [typeL addObject:doctorFriend];
                break;
            case 'm':
                [typeM addObject:doctorFriend];
                break;
            case 'n':
                [typeN addObject:doctorFriend];
                break;
            case 'o':
                [typeO addObject:doctorFriend];
                break;
            case 'p':
                [typeP addObject:doctorFriend];
                break;
            case 'q':
                [typeQ addObject:doctorFriend];
                break;
            case 'r':
                [typeR addObject:doctorFriend];
                break;
            case 's':
                [typeS addObject:doctorFriend];
                break;
            case 't':
                [typeT addObject:doctorFriend];
                break;
            case 'u':
                [typeU addObject:doctorFriend];
                break;
            case 'v':
                [typeV addObject:doctorFriend];
                break;
            case 'w':
                [typeW addObject:doctorFriend];
                break;
            case 'x':
                [typeX addObject:doctorFriend];
                break;
            case 'y':
                [typeY addObject:doctorFriend];
                break;
            case 'z':
                [typeZ addObject:doctorFriend];
                break;
            default:
                [typeOT addObject:doctorFriend];
                break;
        }
    }
}

-(void) addToDictionary{
    if(typeA.count != 0){
        [self.dicFriends setObject:typeA forKey:@"A"];
    }
    if(typeB.count != 0){
        [self.dicFriends setObject:typeB forKey:@"B"];
    }
    if(typeC.count != 0){
        [self.dicFriends setObject:typeC forKey:@"C"];
    }
    if(typeD.count != 0){
        [self.dicFriends setObject:typeD forKey:@"D"];
    }
    if(typeE.count != 0){
        [self.dicFriends setObject:typeE forKey:@"E"];
    }
    if(typeF.count != 0){
        [self.dicFriends setObject:typeF forKey:@"F"];
    }
    if(typeG.count != 0){
        [self.dicFriends setObject:typeG forKey:@"G"];
    }
    if(typeH.count != 0){
        [self.dicFriends setObject:typeH forKey:@"H"];
    }
    if(typeI.count != 0){
        [self.dicFriends setObject:typeI forKey:@"I"];
    }
    if(typeJ.count != 0){
        [self.dicFriends setObject:typeJ forKey:@"J"];
    }
    if(typeK.count != 0){
        [self.dicFriends setObject:typeK forKey:@"K"];
    }
    if(typeL.count != 0){
        [self.dicFriends setObject:typeL forKey:@"L"];
    }
    if(typeM.count != 0){
        [self.dicFriends setObject:typeM forKey:@"M"];
    }
    if(typeN.count != 0){
        [self.dicFriends setObject:typeN forKey:@"N"];
    }
    if(typeO.count != 0){
        [self.dicFriends setObject:typeO forKey:@"O"];
    }
    if(typeP.count != 0){
        [self.dicFriends setObject:typeP forKey:@"P"];
    }
    if(typeQ.count != 0){
        [self.dicFriends setObject:typeQ forKey:@"Q"];
    }
    if(typeR.count != 0){
        [self.dicFriends setObject:typeR forKey:@"R"];
    }
    if(typeS.count != 0){
        [self.dicFriends setObject:typeS forKey:@"S"];
    }
    if(typeT.count != 0){
        [self.dicFriends setObject:typeT forKey:@"T"];
    }
    if(typeU.count != 0){
        [self.dicFriends setObject:typeU forKey:@"U"];
    }
    if(typeV.count != 0){
        [self.dicFriends setObject:typeV forKey:@"V"];
    }
    if(typeW.count != 0){
        [self.dicFriends setObject:typeW forKey:@"W"];
    }
    if(typeX.count != 0){
        [self.dicFriends setObject:typeX forKey:@"X"];
    }
    if(typeY.count != 0){
        [self.dicFriends setObject:typeY forKey:@"Y"];
    }
    if(typeZ.count != 0){
        [self.dicFriends setObject:typeZ forKey:@"Z"];
    }
    if(typeOT.count != 0){
        [self.dicFriends setObject:typeOT forKey:@"OT"];
    }
    else{
        
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
