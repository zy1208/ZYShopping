//
//  ProductModel.m
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ProductModel.h"

@implementation ProductModel

+ (instancetype)productWithDict:(NSDictionary *)dict {
    return [[self alloc] productWithDict:dict];
}

- (instancetype)productWithDict:(NSDictionary *)dict {
    if (dict == nil) return nil;
    ProductModel *model = [[ProductModel alloc] init];
    model.image = dict[@"image"];
    model.money = dict[@"money"];
    model.name = dict[@"name"];
    return model;
}

@end
