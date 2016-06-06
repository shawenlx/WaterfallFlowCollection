//
//  ViewController.m
//  WaterfallFlowCollection
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "WaterfallFlowLayout.h"

static NSString *cell_identifier = @"cell";

@interface ViewController () <WaterfallFlowLayoutDelegate,UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) WaterfallFlowLayout   *layout;
@property (nonatomic, strong) UICollectionView      *collectionView;
@property (nonatomic, strong) NSMutableArray        *itemHeights;       //布局数组
@property (nonatomic, strong) NSMutableArray        *dataSource;        //cell数组
@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WaterfallCollection";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initDataSource];
    [self initView];
    
}

#pragma mark -private
#pragma mark - init data
- (void)initDataSource {
    _itemHeights = [NSMutableArray array];
    _dataSource = [NSMutableArray array];
    
    //init random data
    for (int i = 0; i < 20; i ++) {
        
        [_dataSource addObject:[NSString stringWithFormat:@"%d",i]];
        
        CGFloat itemHeight = arc4random() % 100 + 100;
        [_itemHeights addObject:@(itemHeight)];
    }
}


#pragma mark - init view;
- (void)initView {
    _layout = [[WaterfallFlowLayout alloc] init];
    _layout.delegate = self;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cell_identifier];
    [self.view addSubview:_collectionView];
}


#pragma mark - delegate methods;
#pragma mark - <WaterfallFlowLayoutDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(WaterfallFlowLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_WIDTH - 3 * 10) / 2, [_itemHeights[indexPath.row] floatValue]);
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //使用缓存机制复用cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell_identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

@end
