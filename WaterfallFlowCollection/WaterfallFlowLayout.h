//
//  WaterfallFlowLayout.h
//  WaterfallFlowCollection
//
//  Created by Apple on 16/6/6.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@class WaterfallFlowLayout;

@protocol WaterfallFlowLayoutDelegate <NSObject>

@required
- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(WaterfallFlowLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterfallFlowLayout : UICollectionViewLayout
@property (nonatomic, weak) id<WaterfallFlowLayoutDelegate> delegate;
@end
