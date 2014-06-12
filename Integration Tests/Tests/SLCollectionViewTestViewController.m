//
//  SLCollectionViewTestViewController.m
//  Subliminal
//
//  Created by Jeffrey Davis on 6/11/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

#import "SLCollectionViewTestCell.h"
#import "SLCollectionViewTestHeaderView.h"

@interface SLCollectionViewTestViewController : SLTestCaseViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

static NSString *cellId = @"collectionViewTestCell";
static NSString *headerId = @"collectionViewTestHeaderView";

@implementation SLCollectionViewTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"SLCollectionViewTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerNib:[UINib nibWithNibName:@"SLCollectionViewTestCell" bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:cellId];

    [self.collectionView registerNib:[UINib nibWithNibName:@"SLCollectionViewTestHeaderView" bundle:[NSBundle mainBundle]]
          forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                 withReuseIdentifier:headerId];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SLCollectionViewTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.cellButton.accessibilityLabel = [NSString stringWithFormat:@"Cell Button %@", @(indexPath.row)];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    SLCollectionViewTestHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
    return view;
}

#pragma mark UICollectionViewDelegate

@end
