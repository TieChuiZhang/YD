//
//  MeViewController.m
//  阅读
//
//  Created by Lee on 2017/12/11.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "MeViewController.h"
#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>
#import "HeaderView.h"
#import "MeViewCell.h"
#import <StoreKit/StoreKit.h>
@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource,MFMailComposeViewControllerDelegate>
@property(nonatomic, strong) UITableView *tableView;
/** <#注释#> */
@property (nonatomic, strong) HeaderView *haederView;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    image.image = [UIImage imageNamed:@"headerImage@3x"];
    _tableView.tableHeaderView = image;
    self.haederView = [[HeaderView alloc]initWithFrame:CGRectMake(16, 40, kScreenWidth-33,180)];
    self.haederView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    [self.tableView addSubview:self.haederView];

    
}

- (UITableView *)tableView
{
    if (!_tableView) {
        if (KIsiPhoneX) {
            _tableView = [[UITableView alloc]initWithFrame:
                          CGRectMake(0,0,kScreenWidth,kScreenHeight)
                                                     style:UITableViewStyleGrouped];
        }else{
            _tableView = [[UITableView alloc]initWithFrame:
                          CGRectMake(0,20,kScreenWidth,kScreenHeight)
                                                     style:UITableViewStyleGrouped];
        }
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        self.tableView.sectionFooterHeight = 1;
        self.tableView.sectionHeaderHeight = 1;
        _tableView.backgroundColor = UIColorWithRGBA(246, 246, 246, 0.9);
        _tableView.separatorInset = UIEdgeInsetsMake(0,0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGFloat a = 0.0;
    if (section == 0) {
        a = 10;
        return  _tableView.sectionFooterHeight  = a;
    } else if (section == 1) {
        a = 100;
        return  _tableView.sectionFooterHeight  = a;
    }
    return a;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat a = 0.0;
    if (section == 0) {
        a = 110;
        return  _tableView.sectionFooterHeight  = a;
    } else if (section == 1) {
        a = 0;
        return  _tableView.sectionFooterHeight  = a;
    }
    return a;
}


// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1)
    {
        return 3;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    if (indexPath.section == 0) {
        //MeViewCell *cell = [MeViewCell cellMainWithTableView:tableView];
        //[cell setMainCellValue:nil];
        cell.imageView.image = [UIImage imageNamed:@"1@3x"];
        cell.textLabel.text = @"看过的书籍";
        cell.textLabel.font = FONT_SIZE_H16;
        cell.textLabel.textColor = [UIColor colorWithHexString:@"#52c7ff"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"haoping@3x"];
            cell.textLabel.text = @"请赐予好评";
            cell.textLabel.font = FONT_SIZE_H16;
            cell.textLabel.textColor = [UIColor colorWithHexString:@"#52c7ff"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"lianxi@3x"];
            cell.textLabel.text = @"联系我们";
            cell.textLabel.font = FONT_SIZE_H16;
            cell.textLabel.textColor = [UIColor colorWithHexString:@"#52c7ff"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"shezhi@3x"];
            cell.textLabel.text = @"设置";
            cell.textLabel.font = FONT_SIZE_H16;
            cell.textLabel.textColor = [UIColor colorWithHexString:@"#52c7ff"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    }
    return cell;
}
#pragma mark 点击Cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     //NSLog(@"section: %ld, row: %ld", indexPath.section, indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1 && indexPath.row == 1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setEmail];
        });
       
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[SKStoreReviewController requestReview];
            //NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", @"123"];
            //[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]];
            SHOW_TEXT(@"等待");
        });
    }else if (indexPath.section == 1 && indexPath.row == 2) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[SKStoreReviewController requestReview];
            //NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", @"123"];
            //[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]];
            SHOW_TEXT(@"等待");
        });
    }else if (indexPath.section == 0 && indexPath.row == 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            //[SKStoreReviewController requestReview];
            //NSString *urlStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8", @"123"];
            //[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlStr]];
            SHOW_TEXT(@"等待");
        });
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}

- (void)setEmail
{
    // 判断此iPhone的邮箱是否打开
    if ([MFMailComposeViewController canSendMail]) {
        // 写邮件界面
        MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
        
        picker.mailComposeDelegate = self;
        // 邮件的标题
        [picker setSubject:@"我们如何改进"];
        
        // 接收用户发送的邮件的邮箱
        NSArray *toRecipients = [NSArray arrayWithObject:@"643470816@qq.com"];
        
        [picker setToRecipients:toRecipients];
        
        [self presentViewController:picker animated:NO completion:^{
            
        }];
        
    } else {
        SHOW_TEXT(@"请在您的设置中打开“邮件”！");
    }
}


- (void)dealloc
{
    
}


@end
