//
//  ProductModel.h
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductModel : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *money;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) int count;

+ (instancetype)productWithDict:(NSDictionary *)dict;


@end
