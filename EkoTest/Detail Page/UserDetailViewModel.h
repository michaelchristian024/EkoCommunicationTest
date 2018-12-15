//
//  UserDetailViewModel.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserModel;

NS_ASSUME_NONNULL_BEGIN

@protocol UserDetailViewModel <NSObject>

/**
 condfigure github user webview

 @param url
 */
- (void)configureWebViewWithURL:(NSURL *)url;
@end

@interface UserDetailViewModel : NSObject
@property (nonatomic, weak) id <UserDetailViewModel> action;
@property (strong, nonatomic, readonly) UserModel *user;

- (instancetype)initWithUserModel:(UserModel *)user;


/**
 Trigger when user first load the page
 */
- (void)onLoad;
@end

NS_ASSUME_NONNULL_END
