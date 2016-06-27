//
//  ContactsSectionHeaderView.m
//  微信练习
//
//  Created by qingyun on 16/6/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ContactsSectionHeaderView.h"
#import "FriendGroupModel.h"

@interface ContactsSectionHeaderView ()
@property(nonatomic,strong)UIButton *Btn;
@property(nonatomic,strong)UILabel *onLineLabel;
@end

@implementation ContactsSectionHeaderView

static NSString *headerIdentifier=@"headerSection";
+(instancetype)contactsSectionHeaderView:(UITableView *)tableView{
    ContactsSectionHeaderView *headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    if (headerView==nil) {
        headerView=[[ContactsSectionHeaderView alloc] initWithReuseIdentifier:headerIdentifier];
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        //添加Button
        UIButton *Btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:Btn];
        //设置背景
        UIImage *image=[[UIImage imageNamed:@"buddy_header_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];//后面是拉伸图片的方法，在后面是拉伸的效果（平铺或拉伸）
        UIImage *highLightedimage=[[UIImage imageNamed:@"buddy_header_bg_highlighted"] resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [Btn setBackgroundImage:image forState:UIControlStateNormal];
        [Btn setBackgroundImage:highLightedimage forState:UIControlStateHighlighted];
        //字体颜色
        [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //设置图片
        UIImage *arrowimage=[UIImage imageNamed:@"buddy_header_arrow"];
        [Btn setImage:arrowimage forState:UIControlStateNormal];
        //添加监听事件
        [Btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        //设置Btn的内容模式
        Btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        //设置内容的偏移
        Btn.contentEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        //设置标题的偏移
        Btn.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
        Btn.imageView.contentMode=UIViewContentModeCenter;
        Btn.imageView.clipsToBounds=NO;
        
        //添加Label
        UILabel *label=[[UILabel alloc] init];
        [self.contentView addSubview:label];
        //设置Label的对齐方式
        label.textAlignment=NSTextAlignmentRight;
        _Btn=Btn;
        _onLineLabel=label;
    }
    return self;
}

-(void)btnClick{
    //更改sectionModel中的isOpen的状态
    _friendGroupModel.isOpen=!_friendGroupModel.isOpen;
    if (_headerViewClick) {
        _headerViewClick();
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //设置子视图的frame
    _Btn.frame=self.bounds;
    _onLineLabel.frame=CGRectMake(CGRectGetWidth(self.bounds)-100-10, 0, 100, CGRectGetHeight(self.bounds));
}

//设置Btn的标题，label的文本
-(void)setFriendGroupModel:(FriendGroupModel *)friendGroupModel{
    _friendGroupModel=friendGroupModel;
    [_Btn setTitle:friendGroupModel.name forState:UIControlStateNormal];
    _onLineLabel.text=[NSString stringWithFormat:@"%d/%ld",friendGroupModel.online,friendGroupModel.friends.count];
    if (_friendGroupModel.isOpen) {
        _Btn.imageView.transform=CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _Btn.imageView.transform=CGAffineTransformIdentity;
    }
}
@end
