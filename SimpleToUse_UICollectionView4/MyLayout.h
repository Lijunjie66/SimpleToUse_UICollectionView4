//
//  MyLayout.h
//  SimpleToUse_UICollectionView4
//
//  Created by Geraint on 2018/11/23.
//  Copyright © 2018 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



#pragma mark -- 先自定义一个layout类，这个类继承于UICollectionViewLayout，UICollectionViewLayout是一个布局抽象基类，我们要使用自定义的布局方式，必须将其子类化。（ 可能你还记得，我们在进行瀑布流布局的时候使用过UICollectionViewFlowLayout类，这个类就是继承于UICollectionViewLayout类，系统为我们实现好的一个布局方案。）
@interface MyLayout : UICollectionViewLayout

// 这个int值存储有多少个item
@property (nonatomic, assign) int itemCount;  // 添加一个属性， 直接让外界将item的个数传递进来

@end

NS_ASSUME_NONNULL_END
