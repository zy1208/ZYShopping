//
//  BottomView.h
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomViewHandleDelegate <NSObject>

- (void)bottomViewBuyHandleWithBtn:(UIButton *)sender;

- (void)bottomViewClearHandleWithBtn:(UIButton *)sender;

@end

@interface BottomView : UIView

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UIButton *buyButton;

@property (weak, nonatomic) IBOutlet UIButton *clearButton;

@property (nonatomic, assign) id<BottomViewHandleDelegate> bottomDelegate;

+ (instancetype)bottomView;

@end
