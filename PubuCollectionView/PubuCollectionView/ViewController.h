//
//  ViewController.h
//  PubuCollectionView
//
//  Created by Wong on 15-4-21.
//  Copyright (c) 2015年 我的练习. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "SVPullToRefresh.h"
#import "DataModels.h"
#import "UICollectionViewWaterfallLayout.h"
#import "UIButton+WebCache.h"
@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateWaterfallLayout>
{
    UICollectionView        *_collectionView;
    
}
@property (nonatomic,retain)ZYBaseClass     *baseClass;
@end

