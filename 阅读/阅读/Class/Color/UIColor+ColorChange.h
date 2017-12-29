//
//  UIColor+ColorChange.h
//  阅读
//
//  Created by Lee on 2017/12/18.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorChange)
/** 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)*/
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
