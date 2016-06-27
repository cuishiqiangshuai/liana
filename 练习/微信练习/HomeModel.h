//
//  HomeModel.h
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property(nonatomic,strong)NSString *buycount;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *title;
+(instancetype)modelWithDictionary:(NSDictionary *)dict;
-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
