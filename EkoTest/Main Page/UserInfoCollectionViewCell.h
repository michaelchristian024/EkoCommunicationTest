//
//  UserInfoCollectionViewCell.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserModel;

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoCollectionViewCell : UICollectionViewCell


/**
 Configure cell with user model

 @param user
 */
- (void)configureCellWithUserModel:(UserModel *)user;
@end

NS_ASSUME_NONNULL_END
