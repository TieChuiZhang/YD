//
//  HeaderView.m
//  阅读
//
//  Created by Lee on 2017/12/18.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "HeaderView.h"
@interface HeaderView()
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIImageView *imageViewHeader;
@end


@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [UILabel new];
        label.text = @"看书 V1.0";
        [label setFont:[UIFont systemFontOfSize:14]];
        label.textColor = [UIColor colorWithHexString:@"#52c7ff"];
        _label = label;
        [self addSubview:_label];
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"headerIcon@3x"];
        _imageViewHeader = imageView;
        [self addSubview:_imageViewHeader];
    }
    return self;
}

- (void)layoutSubviews
{
    LeeWeakSelf(self);
    [super layoutSubviews];
    [_imageViewHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself);
        make.top.equalTo(weakself).offset(38);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
    }];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakself);
        make.top.equalTo(weakself.imageViewHeader).offset(80);
        make.height.mas_equalTo(30);
        
    }];
}

@end
