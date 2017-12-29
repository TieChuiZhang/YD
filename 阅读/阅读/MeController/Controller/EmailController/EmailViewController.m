//
//  EmailViewController.m
//  阅读
//
//  Created by Lee on 2017/12/18.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "EmailViewController.h"
#import <MessageUI/MessageUI.h>
@interface EmailViewController ()<MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) UIButton *leftButton;
@end

@implementation EmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.leftButton];
    
    

    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (UIButton *)leftButton
{
    if (!_leftButton) {
        _leftButton = [UIButton new];
        [_leftButton setFrame:CGRectMake(kScreenWidth - 36, 25, 16, 16)];
        [_leftButton setImage:[UIImage imageNamed:@"叉号"] forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(tapLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
    
}

- (void)tapLeftButton:(UIButton *)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (void)dealloc
{

}
@end
