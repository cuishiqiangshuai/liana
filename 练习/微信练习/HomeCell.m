//
//  HomeCell.m
//  微信练习
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "HomeCell.h"
#import "HomeModel.h"

@interface HomeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buycountLabel;

@end
@implementation HomeCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setHomeModel:(HomeModel *)homeModel{
    _homeModel=homeModel;
    _iconImageView.image=[UIImage imageNamed:homeModel.icon];
    _titleLabel.text=homeModel.title;
    _priceLabel.text=homeModel.price;
    _buycountLabel.text=homeModel.buycount;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
