//
//  MainViewCell.m
//  阅读
//
//  Created by Lee on 2017/11/28.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "MainViewCell.h"
@interface MainViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameL;

@end
@implementation MainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    self.nameL.text = _name;
}

@end
