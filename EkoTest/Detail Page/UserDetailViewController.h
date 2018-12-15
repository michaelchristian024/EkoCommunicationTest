//
//  UserDetailViewController.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class UserDetailViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailViewController : BaseViewController

- (instancetype)initWithViewModel:(UserDetailViewModel *)viewModel;
@end

NS_ASSUME_NONNULL_END
