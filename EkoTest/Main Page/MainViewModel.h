//
//  MainViewModel.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserResponseModel, UserModel;

NS_ASSUME_NONNULL_BEGIN

@protocol MainViewModelAction <NSObject>
@required
/**
 Reload main collection view after getting data from fetching the API
 */
- (void)reloadCollectionView;


/**
 Show loading view while fetching the API

 @param shouldShowLoading BOOL
 */
- (void)showLoading:(BOOL)shouldShowLoading;


/**
 Show error view

 @param errorMessage String
 */
- (void)showErrorViewWithMessage:(NSString *)errorMessage;

- (void)navigateToDetailPageWithUserModel:(UserModel *)user;
@end

@interface MainViewModel : NSObject
@property (nonatomic, weak) id <MainViewModelAction> action;
@property (strong, nonatomic, readonly) UserResponseModel *userResponse;

/**
 Triggered when the page first load
 */
- (void)onLoad;


/**
 When user list tapped

 @param indexPath
 */
- (void)onUserCellTappedOnIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
