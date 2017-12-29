//
//  IntroduceViewController.m
//  阅读
//
//  Created by Lee on 2017/12/11.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "IntroduceViewController.h"
#import "TYAttributedLabel.h"

@interface IntroduceViewController ()
@property (nonatomic, weak) TYAttributedLabel *label;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation IntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.extendedLayoutIncludesOpaqueBars = YES;
    //[self addScrollView];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior =                 UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    [self abc];
}

- (void)abc
{
    UIImageView *image = [UIImageView new];
    //image.frame = CGRectMake(0, 20, kScreenWidth, 130);
    if (KIsiPhoneX) {
        image.frame = CGRectMake(0, 0, kScreenWidth, 130);
    }else {
        image.frame = CGRectMake(0, 20, kScreenWidth, 130);
    }
    image.image = [UIImage imageNamed:@"Group 4"];
    [self.scrollView addSubview:image];
    
    UILabel *textOne = [UILabel new];
    textOne.frame = CGRectMake(27,image.frame.size.height+28, 32, 24);
    [textOne setText:@"01"];
    [textOne setFont:[UIFont systemFontOfSize:30]];
    [textOne setTextColor:[UIColor colorWithHexString:@"#999999"]];
    [self.scrollView addSubview:textOne];
    
    UILabel *textOnecontent = [UILabel new];
    textOnecontent.frame = CGRectMake(textOne.frame.size.width+textOne.frame.origin.x+10, image.frame.size.height+29, kScreenWidth-68-45, 48);
    textOnecontent.numberOfLines = 0;
    [textOnecontent setText:@"通过其他应用(QQ、网盘、浏览器、微信)导入"];
    [textOnecontent setFont:[UIFont systemFontOfSize:16]];
    [textOnecontent setTextColor:[UIColor colorWithHexString:@"#52c7ff"]];
    [self.scrollView addSubview:textOnecontent];
    
    UIView *dian1 = [UIView new];
    if (KIsiPhone5) {
         dian1.frame = CGRectMake(52,textOnecontent.frame.origin.y +textOnecontent.frame.size.height+28, 6, 6);
    }else
    {
        dian1.frame = CGRectMake(52,textOnecontent.frame.origin.y +textOnecontent.frame.size.height+28+10, 6, 6);
    }
    dian1.backgroundColor = [UIColor colorWithHexString:@"#52c7ff"];
    dian1.layer.cornerRadius = 3;
    dian1.layer.masksToBounds = YES;
    [self.scrollView addSubview:dian1];
    
    UILabel *oneContent = [UILabel new];
    oneContent.frame = CGRectMake(dian1.frame.origin.x +dian1.frame.size.width+10, textOnecontent.frame.origin.y + textOnecontent.frame.size.height + 20, kScreenWidth-68-45, 60);
    oneContent.numberOfLines = 0;
    [oneContent setText:@"此处以(百度网盘)为例,在网盘中打开txt文件后,点击'打开'按钮"];
    [oneContent setFont:[UIFont systemFontOfSize:16]];
    [oneContent setTextColor:[UIColor colorWithHexString:@"#666666"]];
    [self.scrollView addSubview:oneContent];
    
    UIImageView *Oneimage = [UIImageView new];
    Oneimage.frame =CGRectMake(49, oneContent.frame.origin.y + oneContent.frame.size.height + 15, kScreenWidth-49-47, 37);
    Oneimage.image = [UIImage imageNamed:@"Group 36"];
    [self.scrollView addSubview:Oneimage];
    
    UIView *dian2 = [UIView new];
    if (KIsiPhone5) {
        dian2.frame = CGRectMake(52,Oneimage.frame.origin.y +Oneimage.frame.size.height+30, 6, 6);
    }else{
        dian2.frame = CGRectMake(52,Oneimage.frame.origin.y +Oneimage.frame.size.height+29+10, 6, 6);
    }
    dian2.backgroundColor = [UIColor colorWithHexString:@"#52c7ff"];
    dian2.layer.cornerRadius = 3;
    dian2.layer.masksToBounds = YES;
    [self.scrollView addSubview:dian2];
    
    UILabel *TwoContent = [UILabel new];
    TwoContent.frame = CGRectMake(dian2.frame.origin.x +dian2.frame.size.width+10, Oneimage.frame.origin.y + Oneimage.frame.size.height + 20, kScreenWidth-68-45, 48);
    [TwoContent setText:@"在弹出的窗口中选择 拷贝到阅读"];
    TwoContent.numberOfLines = 0;
    [TwoContent setFont:[UIFont systemFontOfSize:16]];
    [TwoContent setTextColor:[UIColor colorWithHexString:@"#666666"]];
    [self.scrollView addSubview:TwoContent];
    
    UIImageView *Twoimage = [UIImageView new];
    Twoimage.frame = CGRectMake(49, TwoContent.frame.origin.y + TwoContent.frame.size.height + 15, kScreenWidth-49-47, 97);
    Twoimage.image = [UIImage imageNamed:@"WechatIMG1034"];
    [self.scrollView addSubview:Twoimage];
    
    UILabel *textTwo = [UILabel new];
    textTwo.frame = CGRectMake(27, Twoimage.frame.origin.y+Twoimage.frame.size.height+59, 40, 24);
    [textTwo setText:@"02"];
    [textTwo setFont:[UIFont systemFontOfSize:30]];
    [textTwo setTextColor:[UIColor colorWithHexString:@"#999999"]];
    [self.scrollView addSubview:textTwo];
    
    UILabel *textTwocontent = [UILabel new];
    textTwocontent.frame = CGRectMake(textOne.frame.size.width+textOne.frame.origin.x+10, Twoimage.frame.origin.y+Twoimage.frame.size.height + 60, kScreenWidth-68-45, 40);
    [textTwocontent setText:@"iTunes传输(导入文件)"];
    [textTwocontent setFont:[UIFont systemFontOfSize:16]];
    [textTwocontent setTextColor:[UIColor colorWithHexString:@"#52c7ff"]];
    [self.scrollView addSubview:textTwocontent];
    
    UIView *dian2_1 = [UIView new];
    dian2_1.frame = CGRectMake(52,textTwocontent.frame.origin.y +textTwocontent.frame.size.height+30, 6, 6);
    dian2_1.backgroundColor = [UIColor colorWithHexString:@"#52c7ff"];
    dian2_1.layer.cornerRadius = 3;
    dian2_1.layer.masksToBounds = YES;
    [self.scrollView addSubview:dian2_1];
    
    UILabel *TwoContent1_1 = [UILabel new];
    TwoContent1_1.frame = CGRectMake(dian2_1.frame.origin.x +dian2_1.frame.size.width+10,textTwocontent.frame.origin.y +textTwocontent.frame.size.height+20, kScreenWidth-68-45, 48);
    TwoContent1_1.numberOfLines = 0;
    [TwoContent1_1 setText:@"手机与电脑连接后,打开iTunes,选择自己的设备"];
    [TwoContent1_1 setFont:[UIFont systemFontOfSize:16]];
    [TwoContent1_1 setTextColor:[UIColor colorWithHexString:@"#666666"]];
    [self.scrollView addSubview:TwoContent1_1];
    
    UIImageView *Twoimage1_1 = [UIImageView new];
    Twoimage1_1.frame = CGRectMake(49, TwoContent1_1.frame.origin.y + TwoContent1_1.frame.size.height + 15, kScreenWidth-49-47, 200);
    Twoimage1_1.image = [UIImage imageNamed:@"Group 28"];
    [self.scrollView addSubview:Twoimage1_1];
    
    UIView *dian2_2 = [UIView new];
    dian2_2.frame = CGRectMake(52,Twoimage1_1.frame.origin.y +Twoimage1_1.frame.size.height+39, 6, 6);
    dian2_2.backgroundColor = [UIColor colorWithHexString:@"#52c7ff"];
    dian2_2.layer.cornerRadius = 3;
    dian2_2.layer.masksToBounds = YES;
    [self.scrollView addSubview:dian2_2];
    
    UILabel *TwoContent1_2 = [UILabel new];
    TwoContent1_2.frame = CGRectMake(dian2_2.frame.origin.x +dian2_2.frame.size.width+10, Twoimage1_1.frame.origin.y + Twoimage1_1.frame.size.height + 29, kScreenWidth-68-45, 48);
    [TwoContent1_2 setText:@"右侧的列表中点击文件共享,并选中本APP(看点app)"];
     TwoContent1_2.numberOfLines = 0;
    [TwoContent1_2 setFont:[UIFont systemFontOfSize:16]];
    [TwoContent1_2 setTextColor:[UIColor colorWithHexString:@"#666666"]];
    [self.scrollView addSubview:TwoContent1_2];
    
    UIImageView *Twoimage1_2 = [UIImageView new];
    Twoimage1_2.frame = CGRectMake(49, TwoContent1_2.frame.origin.y + TwoContent1_2.frame.size.height + 15, kScreenWidth-49-47, 106);
    Twoimage1_2.image = [UIImage imageNamed:@"Group 5"];
    [self.scrollView addSubview:Twoimage1_2];
    
    UIView *dian2_3 = [UIView new];
    if (KIsiPhone5 || KIsiPhoneX || KIsiPhone6) {
        dian2_3.frame = CGRectMake(52,Twoimage1_2.frame.origin.y +Twoimage1_2.frame.size.height+40, 6, 6);
    }else {
        dian2_3.frame = CGRectMake(52,Twoimage1_2.frame.origin.y +Twoimage1_2.frame.size.height+40+11, 6, 6);
    }
    dian2_3.backgroundColor = [UIColor colorWithHexString:@"#52c7ff"];
    dian2_3.layer.cornerRadius = 3;
    dian2_3.layer.masksToBounds = YES;
    [self.scrollView addSubview:dian2_3];
    
    UILabel *TwoContent1_3 = [UILabel new];
    TwoContent1_3.frame = CGRectMake(dian2_3.frame.origin.x +dian2_3.frame.size.width+10, Twoimage1_2.frame.origin.y + Twoimage1_2.frame.size.height + 30, kScreenWidth-68-45, 48);
    TwoContent1_3.numberOfLines = 0;
    [TwoContent1_3 setText:@"右下角选择添加,也可以把文件直接拖进来"];
    [TwoContent1_3 setFont:[UIFont systemFontOfSize:16]];
    [TwoContent1_3 setTextColor:[UIColor colorWithHexString:@"#666666"]];
    [self.scrollView addSubview:TwoContent1_3];
    
    UIImageView *Twoimage1_3 = [UIImageView new];
    Twoimage1_3.frame = CGRectMake(49, TwoContent1_3.frame.origin.y + TwoContent1_3.frame.size.height + 15, kScreenWidth-49-47, 66);
    Twoimage1_3.image = [UIImage imageNamed:@"Group 31"];
    [self.scrollView addSubview:Twoimage1_3];
    if (KIsiPhoneX) {
        [_scrollView setContentSize:CGSizeMake(0, Twoimage1_3.frame.origin.y+ Twoimage1_3.frame.size.height+ 10+88)];
    }else{
        [_scrollView setContentSize:CGSizeMake(0, Twoimage1_3.frame.origin.y+ Twoimage1_3.frame.size.height+ 10+64)];
    }
}


@end
