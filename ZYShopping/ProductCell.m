//
//  ProductCell.m
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ProductCell.h"

static NSString *const productCellID = @"productCellID";

@interface ProductCell()

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
//减
@property (weak, nonatomic) IBOutlet UIButton *minButton;
//加
@property (weak, nonatomic) IBOutlet UIButton *addButton;
//数量
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (nonatomic, assign) int wineCount;

@end

@implementation ProductCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.minButton.enabled = NO;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:productCellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ProductCell class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setProductModel:(ProductModel *)productModel {
    _productModel = productModel;
    
    _photoView.image = [UIImage imageNamed:_productModel.image];
    _nameLabel.text = _productModel.name;
    _moneyLabel.text = [NSString stringWithFormat:@"￥%@", _productModel.money];
    _countLabel.text = [NSString stringWithFormat:@"%d", _productModel.count];
}

#pragma mark -- 减
- (IBAction)minButtonDidClick:(UIButton *)sender {
    self.wineCount --;
    if (self.wineCount < 0) return;
    if (self.wineCount == 0) {
        self.minButton.enabled = NO;
    }
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wineCount];
    _productModel.count = self.wineCount;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(productMinBtnClickHandle:)]) {
        [self.delegate productMinBtnClickHandle:_productModel];
    }
}

#pragma mark -- 加
- (IBAction)addButtonDidClick:(UIButton *)sender {
    self.wineCount ++;
    self.minButton.enabled = YES;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.wineCount];
    _productModel.count = self.wineCount;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(productAddBtnClickhandle:)]) {
        [self.delegate productAddBtnClickhandle:_productModel];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
