//
//  MeViewCell.m
//  阅读
//
//  Created by Lee on 2017/12/15.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "MeViewCell.h"
@interface MeViewCell()
//@property (strong, nonatomic)  UILabel *member_name;
//@property (strong, nonatomic)  UIImageView *image;

@end
@implementation MeViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //_image=[[UIImageView alloc]init];
        //[self.contentView addSubview:_image];
        
        //会员姓名
//        _member_name = [[UILabel alloc]init];
//        _member_name.textColor = UIColorWithRGB(255, 217,64);
//        _member_name.textAlignment = NSTextAlignmentLeft;
//        [self.contentView addSubview:_member_name];

        //[self setConstant];//设置位置约束
    }
    return self;
}
#pragma mark - 设置背景位置约束
//- (void)setConstant
//{
//    //1.图片默认头像
//    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self).offset(10);//距上
//        //make.left.mas_equalTo(self).offset(self.bounds.size.width/2 - _image.bounds.size.width/2);//距左
//        make.centerX.equalTo(self);
//        make.height.mas_equalTo(80);
//        make.width.mas_equalTo(80);
//    }];
//
//    [_member_name mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.bottom.equalTo(self).offset(-10);
//        make.height.mas_equalTo(30);
//    }];
//}

//-(void)setMainCellValue:(MeModel *) mainModel
//{
//    _mainModel = mainModel;
//    _member_name.text = @"阅读 V1.0";
//    _image.image = [UIImage imageNamed:@"tabBar_contactPerson"];//默认本地图片
//
//
//    //yy_image方法(暂不使用)
//    //NSString *cover_PIC     = [PICbaseRoute stringByAppendingFormat:@"%@",_merchantModel.merchant_pic];
//    //_image.yy_imageURL  = [NSURL URLWithString:cover_PIC];//图片
//}

+ (instancetype)cellMainWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"mainViewCell";
    MeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = UIColorWithRGB(32,29, 30);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;//无色
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
