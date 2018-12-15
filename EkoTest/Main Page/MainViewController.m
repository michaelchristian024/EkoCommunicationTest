//
//  MainViewController.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "MainViewController.h"
#import "UserResponseModel.h"
#import "MainViewModel.h"
#import "UserInfoCollectionViewCell.h"
#import "UINavigationController+Eko.h"

@interface MainViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MainViewModelAction>
@property (strong, nonatomic) IBOutlet UICollectionView *userListCollectionView;
@property (strong, nonatomic) MainViewModel *viewModel;
@end

@implementation MainViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.viewModel = [MainViewModel new];
        self.viewModel.action = self;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userListCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass([UserInfoCollectionViewCell class]) bundle:nil]
                      forCellWithReuseIdentifier:NSStringFromClass([UserInfoCollectionViewCell class])];
    
    [self.viewModel onLoad];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel onUserCellTappedOnIndexPath:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width - 16, 120);
}

#pragma mark - UICollectionViewDataSource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UserInfoCollectionViewCell *userCell = (UserInfoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserInfoCollectionViewCell class]) forIndexPath:indexPath];
    [userCell configureCellWithUserModel:self.viewModel.userResponse.userArray[indexPath.row]];
    
    return userCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.userResponse.userArray.count;
}

#pragma mark - MainViewModelAction
- (void)reloadCollectionView {
    [self.userListCollectionView reloadData];
}

- (void)showLoading:(BOOL)shouldShowLoading {
    if (shouldShowLoading) {
        [self showLoadingView];
    }
    else {
        [self hideLoadingView];
    }
}

- (void)navigateToDetailPageWithUserModel:(UserModel *)user {
    [self.navigationController navigateToDetailPageWithUserModel:user];
}

@end
