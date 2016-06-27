//
//  HomeSearchVC.h
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSearchVC : UITableViewController<UISearchResultsUpdating>
//设置搜索的数据源
@property(nonatomic,strong)NSArray *array;
@end
