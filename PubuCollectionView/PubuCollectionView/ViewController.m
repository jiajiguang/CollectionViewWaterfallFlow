//
//  ViewController.m
//  PubuCollectionView
//
//  Created by Wong on 15-4-21.
//  Copyright (c) 2015年 我的练习. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //实现瀑布流
    UICollectionViewWaterfallLayout *layout=[[UICollectionViewWaterfallLayout alloc] init];
    layout.delegate=self;
    layout.columnCount=2;
    layout.itemWidth=180;
    layout.sectionInset=UIEdgeInsetsMake(100, 5, 50, 5);
    
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self request];
}
-(void)request{
    NSString *str=[NSString stringWithFormat:@"http://api2.hichao.com/stars?category=全部&page=%d",0];
    NSString *strUrl= (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, NULL, kCFStringEncodingUTF8);
    AFHTTPRequestOperationManager *manage=[AFHTTPRequestOperationManager manager];
    [manage GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.baseClass=[ZYBaseClass modelObjectWithDictionary:responseObject];
        [_collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.baseClass.data.items.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.bnt.frame=CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height);
    ZYItems *item=self.baseClass.data.items[indexPath.row];
    [cell.bnt sd_setBackgroundImageWithURL:[NSURL URLWithString:item.component.picUrl] forState:UIControlStateNormal];
    return cell;
}


#pragma mark UICollectionViewDelegateWaterfallLayout
//返回没个item的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYItems *item=self.baseClass.data.items[indexPath.row];
    if (!item.height) {
        return 150;
    }
    float weight=[item.width floatValue];
    float height=[item.height floatValue];
    
    return 180*height/weight;
}
@end
