//
//  ContactsTVC.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ContactsTVC.h"
#import "FriendModel.h"
#import "FriendGroupModel.h"
#import "FriendCell.h"
#import "ContactsSectionHeaderView.h"

@interface ContactsTVC ()
@property(nonatomic,strong)NSMutableArray *friendsArray;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bianJiItem;
@end

@implementation ContactsTVC
static NSString *friendIdenitifier=@"friendCell";

-(NSArray *)friendsArray{
    if (_friendsArray==nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models=[NSMutableArray array];
        for (NSDictionary *dict in array) {
            FriendGroupModel *friendGroup=[FriendGroupModel modelWithDictionary:dict];
            [models addObject:friendGroup];
        }
        _friendsArray=models;
    }
    
    return _friendsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:friendIdenitifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.friendsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //获取当前的模型
    FriendGroupModel *friendGroupModel=self.friendsArray[section];
    return friendGroupModel.isOpen ? friendGroupModel.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell=[tableView dequeueReusableCellWithIdentifier:friendIdenitifier forIndexPath:indexPath];
    //获得当前cell所在的section对应的模型
    FriendGroupModel *friendGroupModel=self.friendsArray[indexPath.section];
    //获得当前cell对应的模型
    FriendModel *friendModel=friendGroupModel.friends[indexPath.row];
    cell.friendModel=friendModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ContactsSectionHeaderView *sectionHeaderView=[ContactsSectionHeaderView contactsSectionHeaderView:tableView];
    //获取当前cell所在的section对应的模型
    FriendGroupModel *friendGroupModel=self.friendsArray[section];
    sectionHeaderView.friendGroupModel=friendGroupModel;
    sectionHeaderView.headerViewClick=^{
     [self.tableView reloadData];
    };
    return sectionHeaderView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
