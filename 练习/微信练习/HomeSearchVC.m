//
//  HomeSearchVC.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "HomeSearchVC.h"
#import "SearchCell.h"

@interface HomeSearchVC ()
@property(nonatomic,strong)NSArray *results;
@end

@implementation HomeSearchVC

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    //搜索条件，在searchBar上
    NSString *filterString=searchController.searchBar.text;
    //如果filterString为nil，或者为空字符串@“”
    if (!filterString||filterString.length==0) {
        _results=_array;
    }else{
        //SELF为首页的Model
        NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF.title CONTAINS[CD] %@",filterString];
        _results=[_array filteredArrayUsingPredicate:predicate];
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.results.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchCell *cell=[tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    if (cell==nil) {
        cell=[[NSBundle mainBundle] loadNibNamed:@"SearchCell" owner:self options:nil].firstObject;
    }
    //配置cell
    HomeModel *homeModel=_results[indexPath.row];
    cell.homeModel=homeModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
