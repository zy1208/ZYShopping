//
//  BottomView.m
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.buyButton.enabled = NO;
}

+ (instancetype)bottomView {
    BottomView *bottomView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BottomView class]) owner:nil options:nil] lastObject];
    return bottomView;
}

//购买
- (IBAction)buyBtnDidClick:(UIButton *)sender {
    if (self.bottomDelegate && [self.bottomDelegate respondsToSelector:@selector(bottomViewBuyHandleWithBtn:)]) {
        [self.bottomDelegate bottomViewBuyHandleWithBtn:sender];
    }
}

- (IBAction)clearBtnDidClick:(UIButton *)sender {
    if (self.bottomDelegate && [self.bottomDelegate respondsToSelector:@selector(bottomViewBuyHandleWithBtn:)]) {
        [self.bottomDelegate bottomViewClearHandleWithBtn:sender];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
