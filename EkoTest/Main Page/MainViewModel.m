//
//  MainViewModel.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "MainViewModel.h"
#import "UserResponseModel.h"
#import <UIKit/UIKit.h>

@interface MainViewModel ()
@property (strong, nonatomic, readwrite) UserResponseModel *userResponse;
@end

@implementation MainViewModel

- (void)onLoad {
    [self.action showLoading:YES];
    [UserResponseModel getUserAPI:^(UserResponseModel * _Nonnull userResponse) {
        self.userResponse = userResponse;
        [self.action reloadCollectionView];
        [self.action showLoading:NO];
    } failureResponse:^(NSError * _Nonnull errorResponse) {
        [self.action showErrorViewWithMessage:[errorResponse localizedDescription]];
        [self.action showLoading:NO];
    }];
}

- (void)onUserCellTappedOnIndexPath:(NSIndexPath *)indexPath {
    [self.action navigateToDetailPageWithUserModel:self.userResponse.userArray[indexPath.row]];
}
@end
