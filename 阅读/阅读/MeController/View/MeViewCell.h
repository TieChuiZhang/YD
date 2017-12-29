//
//  MeViewCell.h
//  阅读
//
//  Created by Lee on 2017/12/15.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MeModel;

@interface MeViewCell : UITableViewCell

@property (strong, nonatomic) MeModel *mainModel;

//- (void) setMainCellValue:(MeModel *) mainModel;

+ (instancetype)cellMainWithTableView:(UITableView *)tableView;
@end
