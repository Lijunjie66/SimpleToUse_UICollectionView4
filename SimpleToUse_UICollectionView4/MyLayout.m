//
//  MyLayout.m
//  SimpleToUse_UICollectionView4
//
//  Created by Geraint on 2018/11/23.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
{
    NSMutableArray *_attributeArray; // 自定义布局配置数组
}

#pragma mark --  数组的相关设置在这个方法中
// 布局前的准备会调用这个方法
- (void)prepareLayout {
    [super prepareLayout];
    
    // 获取item的个数
    _itemCount  = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc] init];
    
    // 先设定大圆的半径  取长和宽最短的
    CGFloat radius = MIN(self.collectionView.frame.size.width, self.collectionView.frame.size.height) / 2;
    
    // 计算圆心位置
    CGPoint center = CGPointMake(self.collectionView.frame.size.width / 2, self.collectionView.frame.size.height / 2);
    
    // 设置每个item的大小为50*50 则半径为25
    for (int i = 0; i < _itemCount; i++) {
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        // 设置item的大小
        attris.size = CGSizeMake(50, 50);
        // 计算每个item的圆心位置
        /*
                .
             . . . .
              .   .
                .
         */
        // 计算每个item中心的坐标
        // 算出的 x、y 值还要减去item自身的半径大小
        float x = center.x + cosf(2 * M_PI / _itemCount * i) * (radius - 25);
        float y = center.y + sinf(2 * M_PI / _itemCount * i) * (radius - 25);
        
        attris.center = CGPointMake(x, y);
        [_attributeArray addObject:attris];
        
    }
    
}

// 设置内容区域的大小
- (CGSize)collectionViewContentSize {
    return self.collectionView.frame.size;
}

// 返回设置的数组
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}



@end
