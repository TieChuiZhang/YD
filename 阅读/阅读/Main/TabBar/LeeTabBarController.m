//
//  LeeTabBarController.m
//  zhenghe
//
//  Created by Lee on 2017/7/23.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "LeeTabBarController.h"



@interface LeeTabBarController ()

@end

@implementation LeeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.viewControllers = @[self.homeVc,self.introducVc,self.meVc];
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#52c7ff"];
   
}
//- (void)viewWillLayoutSubviews{
//    if (KIsiPhoneX) {
//        CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
//        tabFrame.size.height = 80;
//        tabFrame.origin.y = self.view.frame.size.height - 65;
//        self.tabBar.frame = tabFrame;
//    }
//}

- (ViewController *)homeVc {
    if (!_homeVc) {
        _homeVc = [ViewController new];
        _homeVc.tabBarItem.title = @"首页";
        [_homeVc.tabBarItem setImage:[UIImage imageNamed:@"shouye@3x"]];
        [_homeVc.tabBarItem setSelectedImage:[UIImage imageNamed:@"shouye_xuanzhong@3x"]];
    }
    return _homeVc;
}

- (IntroduceViewController *)introducVc {
    if (!_introducVc) {
        _introducVc = [IntroduceViewController new];
        _introducVc.title = @"使用方法";
        [_introducVc.tabBarItem setImage:[UIImage imageNamed:@"使用说明2@3x"]];
        [_introducVc.tabBarItem setSelectedImage:[UIImage imageNamed:@"使用说明@3x"]];
    }
    return _introducVc;
}

- (MeViewController *)meVc {
    if (!_meVc) {
        _meVc = [MeViewController new];
        _meVc.title = @"我的";
        //self.tabBar.tintColor = [UIColor colorWithRed:68/255.0 green:173/255.0 blue:159/255.0 alpha:1];
        self.tabBar.tintColor = [UIColor colorWithRed:33/255.0 green:60/255.0 blue:36/255.0 alpha:1];
        [_meVc.tabBarItem setImage:[UIImage imageNamed:@"gerenzhongxin@3x"]];
        [_meVc.tabBarItem setSelectedImage:[UIImage imageNamed:@"gerenzhongxin_xuanzhong@3x"]];
    }
    return _meVc;
}




@end
