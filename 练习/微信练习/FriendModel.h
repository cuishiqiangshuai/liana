//
//  FriendModel.h
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *status;
@property(nonatomic)BOOL vip;

+(instancetype)modelWithDictionary:(NSDictionary *)dict;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
