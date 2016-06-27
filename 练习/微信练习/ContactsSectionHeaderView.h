//
//  ContactsSectionHeaderView.h
//  微信练习
//
//  Created by qingyun on 16/6/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendGroupModel;
@interface ContactsSectionHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)FriendGroupModel *friendGroupModel;

@property(nonatomic,strong)void(^headerViewClick)();

+(instancetype)contactsSectionHeaderView:(UITableView *)tableView;

@end
