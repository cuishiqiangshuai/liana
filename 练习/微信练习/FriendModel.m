//
//  FriendModel.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel
+(instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
