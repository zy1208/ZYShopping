//
//  CustomButton.m
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor redColor].CGColor ;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = self.bounds.size.width *0.5;
    self.layer.masksToBounds = YES;
}

@end
