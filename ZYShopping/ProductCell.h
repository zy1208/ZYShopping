//
//  ProductCell.h
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@protocol ProductCellHandleDelegate <NSObject>

- (void)productMinBtnClickHandle:(ProductModel *)currentModel;

- (void)productAddBtnClickhandle:(ProductModel *)currentModel;

@end

@interface ProductCell : UITableViewCell

@property (nonatomic, strong) ProductModel *productModel;

@property (nonatomic, assign) id<ProductCellHandleDelegate> delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
