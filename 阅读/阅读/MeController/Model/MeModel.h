//
//  MeModel.h
//  阅读
//
//  Created by Lee on 2017/12/15.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeModel : NSObject

/** id */
@property (nonatomic, copy) NSString *member_id;
/** 名称 */
@property (nonatomic, copy) NSString *member_name;
/** 电话 */
@property (nonatomic, copy) NSString *member_tel;
@end
