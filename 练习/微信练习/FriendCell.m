//
//  FriendCell.m
//  微信练习
//
//  Created by qingyun on 16/6/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "FriendCell.h"
#import "FriendModel.h"

@implementation FriendCell

//从数列里面取得时候取不到，系统会自动常见一个，所以从写这个方法建一个subtitle（在自定义单元格里有说过）
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
    }
    return self;
}

-(void)setFriendModel:(FriendModel *)friendModel{
    _friendModel=friendModel;
    self.imageView.image=[UIImage imageNamed:friendModel.icon];
    self.textLabel.text=friendModel.name;
    self.detailTextLabel.text=friendModel.status;
    self.textLabel.textColor=friendModel.vip ? [UIColor redColor] : [UIColor blackColor];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
