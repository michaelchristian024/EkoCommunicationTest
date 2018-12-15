//
//  UINavigationController+Eko.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"
#import "UserDetailViewController.h"
#import "UserDetailViewModel.h"

@implementation UINavigationController (Eko)
- (void)navigateToDetailPageWithUserModel:(UserModel *)user {
    UserDetailViewModel *viewModel = [[UserDetailViewModel alloc] initWithUserModel:user];
    
    UserDetailViewController *userVC = [[UserDetailViewController alloc] initWithViewModel:viewModel];
    [self pushViewController:userVC animated:YES];
}
@end
