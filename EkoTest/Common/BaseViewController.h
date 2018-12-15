//
//  BaseViewController.h
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 Show the loading view
 */
- (void)showLoadingView;


/**
 Hide the loading view
 */
- (void)hideLoadingView;


/**
 Show error view

 @param errorMessage String
 */
- (void)showErrorViewWithErrorMessage:(NSString *)errorMessage;

/**
 Hide error view
 */
- (void)hideErrorView;
@end

NS_ASSUME_NONNULL_END
