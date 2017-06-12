//
//  TTDataSource.m
//  TTLightKit
//
//  Created by 天智慧启 on 2017/5/17.
//  Copyright © 2017年 天智慧启. All rights reserved.
//

#import "TTDataSource.h"

@interface TTDataSource ()

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, copy) NSString *cellID;
@property (nonatomic, copy) TTConfigureCellBlock configureCellBlock;

@end

@implementation TTDataSource

/**
 初始化数据源
 
 @param CellID CellID
 @param dataSource 数据源数组
 @param configureCellBlock 代理回调
 @return 返回数据源
 */
- (id)initWithCellIdentifier:(NSString *)CellID
                  dataSource:(NSArray *)dataSource
          configureCellBlock:(TTConfigureCellBlock)configureCellBlock {
    self = [super init];
    if (self) {
        self.cellID = CellID;
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.configureCellBlock = [configureCellBlock copy];
    }
    return self;
}

/**
 添加数据源,用于分页
 
 @param dataSource 添加进来的数组
 */
- (void)addDataSource:(NSArray *)dataSource {
    if (dataSource == nil) {
        return;
    }
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    [_dataSource addObjectsFromArray:dataSource];
    
}

/**
 获取某一行cell的对象
 
 @param indexPath indexpath
 @return 对象
 */
- (id)dataAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataSource[indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellID forIndexPath:indexPath];
    id data = [self dataAtIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, data, indexPath);
    }
    return cell;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellID forIndexPath:indexPath];
    id data = [self dataAtIndexPath:indexPath];
    if (self.configureCellBlock) {
        self.configureCellBlock(cell, data, indexPath);
    }
    return cell;
}

@end
