//
//  LeeTabBarController.h
//  zhenghe
//
//  Created by Lee on 2017/7/23.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "IntroduceViewController.h"
#import "MeViewController.h"

@interface LeeTabBarController : UITabBarController

@property (nonatomic, strong) ViewController *homeVc;

@property (nonatomic, strong) IntroduceViewController *introducVc;

@property (nonatomic, strong) MeViewController *meVc;//我




@end
