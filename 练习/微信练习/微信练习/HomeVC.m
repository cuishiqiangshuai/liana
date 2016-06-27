//
//  ViewController.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "HomeVC.h"
#import "HomeModel.h"
#import "HomeCell.h"
#import "HomeSearchVC.h"
#import "WebVC.h"
#import "QYDataBaseTool.h"
#import "DataBaseFile.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define TableViewheaderImageNum 3

@interface HomeVC ()
@property(nonatomic,strong)NSMutableArray *tgsArr;
@property(nonatomic,strong)HomeCell *cell;
@property(nonatomic,strong)UISearchController *searchController;
@end

@implementation HomeVC

//-(NSArray *)tgsArr{
//    if (_tgsArr==nil) {
//        NSString *path=[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
//        NSArray *array=[NSArray arrayWithContentsOfFile:path];
//        NSMutableArray *models=[NSMutableArray array];
//        for (NSDictionary *dict in array) {
//            HomeModel *homeModel=[HomeModel modelWithDictionary:dict];
//            [models addObject:homeModel];
//        }
//        _tgsArr=models;
//    }
//    return _tgsArr;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    [self addTableViewHeaderView];
    [self addLeftBarButtonItem];
    [self addRefreshControl];
    [self addSearchController];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(saveAction:)];
    __weak HomeVC *weakSelf=self;
    [QYDataBaseTool selectStatementsSql:selectAll withParsmeters:nil forMode:@"HomeModel" block:^(NSMutableArray *resposeOjbc, NSString *errorMsg) {
        if (resposeOjbc.count>0) {
            //从本地读取
            weakSelf.tgsArr=resposeOjbc;
            [weakSelf.tableView reloadData];
        }else{
            NSString *path=[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
                    NSArray *array=[NSArray arrayWithContentsOfFile:path];
                    NSMutableArray *models=[NSMutableArray array];
                    for (NSDictionary *dict in array) {
                        HomeModel *homeModel=[HomeModel modelWithDictionary:dict];
                        [models addObject:homeModel];
                    }
            weakSelf.tgsArr=models;
            [self.tableView reloadData];
        }
    }];
}

//添加搜索视图控制器
-(void)addSearchController{
    HomeSearchVC *searchVC=[[HomeSearchVC alloc] init];
    searchVC.array=self.tgsArr;
    _searchController=[[UISearchController alloc] initWithSearchResultsController:searchVC];
    _searchController.hidesNavigationBarDuringPresentation=YES;
    _searchController.dimsBackgroundDuringPresentation=YES;
    _searchController.searchResultsUpdater=searchVC;
}
- (IBAction)searchItem:(UIBarButtonItem *)sender {
    [self presentViewController:_searchController animated:YES completion:nil];
}

//添加下拉刷新
-(void)addRefreshControl{
    UIRefreshControl *refresh=[[UIRefreshControl alloc] init];
    [self.tableView addSubview:refresh];
    [refresh addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
}

//下拉刷新
-(void)refresh:(UIRefreshControl *)refresh{
    [refresh performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
}

//添加头视图的scrollView
-(void)addTableViewHeaderView{
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 100)];
    //上下没移动contentSize的y可设置为0
    scrollView.contentSize=CGSizeMake(ScreenW*TableViewheaderImageNum, 0);
    scrollView.pagingEnabled=YES;
    for (int i=0; i<TableViewheaderImageNum; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(ScreenW*i, 0, ScreenW, 100)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]];
        [scrollView addSubview:imageView];
    }
    self.tableView.tableHeaderView=scrollView;
}

//添加导航栏的左item
-(void)addLeftBarButtonItem{
    UIBarButtonItem *leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    self.navigationItem.leftBarButtonItem=leftBarButtonItem;
}

-(void)edit:(UIBarButtonItem *)sender{
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title=@"完成";
        [self.tableView setEditing:YES animated:YES];
    }else{
        sender.title=@"编辑";
        [self.tableView setEditing:NO animated:NO];
    }
}

#pragma tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgsArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeModel *homeModel=self.tgsArr[indexPath.row];
    HomeCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.homeModel=homeModel;
    return cell;
}

#pragma tableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController.tabBarController setHidesBottomBarWhenPushed:YES];
    WebVC *webVC=[[WebVC alloc] init];
    webVC.urlString=@"http://www.apple.com";
    [self.navigationController pushViewController:webVC animated:YES];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [_tgsArr removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        HomeModel *model=self.tgsArr[indexPath.row];
        NSDictionary *pras=@{@"icon":model.icon};
        [QYDataBaseTool updateStatementsSql:DeleteStu_Id withParsmeters:pras block:^(BOOL isOk, NSString *errorMsg) {
            
        }];
    }else if (editingStyle==UITableViewCellEditingStyleInsert){
        
    }
}

-(void)saveAction:(UIBarButtonItem *)sender{
    for (HomeModel *model in self.tgsArr) {
        NSDictionary *dic=@{@"buycount":model.buycount,@"icon":model.icon,@"price":model.price,@"title":model.title};
        [QYDataBaseTool updateStatementsSql:Inserinto withParsmeters:dic block:^(BOOL isOk, NSString *errorMsg) {
            
        }];
    }
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0&&indexPath.row==0) {
//        return NO;
//    }
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //取出当前选中的单元格对应的数据模型
    HomeModel *homeModel=(HomeModel *)_tgsArr[sourceIndexPath.row];
    //把当前的数据模型从数据源中删除
    [_tgsArr removeObjectAtIndex:sourceIndexPath.row];
    //把当前前的数据模型插入到数据源中
    [_tgsArr insertObject:homeModel atIndex:destinationIndexPath.row];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
