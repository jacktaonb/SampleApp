//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by 王韬 on 2020/11/5.
//

#import "GTVideoViewController.h"
#import "GTViedoCoverView.h"
#import "GTVideoToolbar.h"

@interface GTVideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation GTVideoViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width / 16 * 9 + GTVideoToolbarHeight);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[GTViedoCoverView class] forCellWithReuseIdentifier:@"GTViedoCoverView"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTViedoCoverView" forIndexPath:indexPath];
    if([cell isKindOfClass:[GTViedoCoverView class]]){
        //http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        
        [((GTViedoCoverView *)cell) layoutWithViedoCoverUrl:@"/Users/wangtao/Desktop/SampleApp/SampleApp/Assets.xcassets/123.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.item % 3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10) / 2, 300);
//    }
//}

@end
