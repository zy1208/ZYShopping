//
//  ViewController.m
//  ZYTestShopping
//
//  Created by Palmpay on 2018/6/14.
//  Copyright © 2018年 palm. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "ProductModel.h"
#import "BottomView.h"

#define kMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kMainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, ProductCellHandleDelegate, BottomViewHandleDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *productArr;

@property (nonatomic, strong) BottomView *bottomView;

@property (nonatomic, strong) NSMutableArray *shopArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加控件
    [self commonInit];
    //加载数据
    [self getData];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //设置layout
    [self setLayout];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.productArr.count ? self.productArr.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [ProductCell cellWithTableView:tableView];
    cell.productModel = self.productArr[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark -- ProductCellHandleDelegate
- (void)productMinBtnClickHandle:(ProductModel *)currentModel {
    int total = [self.bottomView.totalLabel.text intValue] - [currentModel.money intValue];
    if (total < 0)  return;
    if (total == 0) {
        self.bottomView.buyButton.enabled = NO;
    }
    self.bottomView.totalLabel.text = [NSString stringWithFormat:@"%d", total];
    
    if (currentModel.count <= 0) {
        if ([self.shopArr containsObject:currentModel]) {
            [self.shopArr removeObject:currentModel];
        }
    }
}

- (void)productAddBtnClickhandle:(ProductModel *)currentModel {
    int total = [currentModel.money intValue] + [self.bottomView.totalLabel.text intValue];
    self.bottomView.buyButton.enabled = YES;
    self.bottomView.totalLabel.text = [NSString stringWithFormat:@"%d", total];
    if (![self.shopArr containsObject:currentModel]) {
        [self.shopArr addObject:currentModel];
    }
}

#pragma mark -- BottomViewHandleDelegate
- (void)bottomViewBuyHandleWithBtn:(UIButton *)sender {
    for (ProductModel *model in self.shopArr) {
        NSLog(@"%@ == count == %d", model.name, model.count);
    }
}

- (void)bottomViewClearHandleWithBtn:(UIButton *)sender {
    if (self.shopArr.count) {
        [self.shopArr removeAllObjects];
    }
    self.bottomView.buyButton.enabled = NO;
    self.bottomView.totalLabel.text = @"0";
    
    for (ProductModel *model in self.productArr) {
        model.count = 0;
    }
    [self.tableView reloadData];
}

#pragma mark -- 获取数据
- (NSArray *)getData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil];
    NSArray *dataArr = [NSArray arrayWithContentsOfFile:path];
    if (dataArr) {
        NSMutableArray *data = [NSMutableArray array];
        for (NSDictionary *dict in dataArr) {
            ProductModel *model = [ProductModel productWithDict:dict];
            [data addObject:model];
        }
        self.productArr = [data mutableCopy];
    }
    return self.productArr;
}

- (void)commonInit {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

- (void)setLayout {
    self.tableView.frame = [UIScreen mainScreen].bounds;
    self.bottomView.frame = CGRectMake(0, kMainScreenHeight - 57, kMainScreenWidth, 57);
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero];
        //        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}

- (BottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [BottomView bottomView];
        _bottomView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _bottomView.bottomDelegate = self;
    }
    return _bottomView;
}

- (NSArray *)productArr {
    if (!_productArr) {
        _productArr = [NSArray array];
    }
    return _productArr;
}

- (NSMutableArray *)shopArr {
    if (!_shopArr) {
        _shopArr = [NSMutableArray array];
    }
    return _shopArr;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

