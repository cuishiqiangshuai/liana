//
//  FriendGroupModel.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FriendGroupModel.h"
#import "FriendModel.h"

@implementation FriendGroupModel
+(instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *friends=[NSMutableArray array];
        for (NSDictionary *friendDict in _friends) {
            FriendModel *friendModel=[FriendModel modelWithDictionary:friendDict];
            [friends addObject:friendModel];
        }
        _friends=friends;
        _isOpen=NO;
    }
    return self;
}
@end
