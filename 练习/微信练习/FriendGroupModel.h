//
//  FriendGroupModel.h
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendGroupModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic)int online;
@property(nonatomic,strong)NSMutableArray *friends;
@property(nonatomic)BOOL isOpen;

+(instancetype)modelWithDictionary:(NSDictionary *)dict;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
