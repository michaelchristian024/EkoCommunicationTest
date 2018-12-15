//
//  BaseViewController.m
//  EkoTest
//
//  Created by Michael Christian on 15/12/18.
//  Copyright © 2018 Michael Christian. All rights reserved.
//

#import "BaseViewController.h"
#import <Masonry/Masonry.h>

@interface BaseViewController ()
@property (strong, nonatomic) UIView *loadingView;
@property (strong, nonatomic) UIView *errorView;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;
@property (strong, nonatomic) UILabel *errorLabel;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self generateErrorView];
    [self generateLoadingView];
}

- (void)generateErrorView {
    self.errorView = [UIView new];
    self.errorView.backgroundColor = [UIColor whiteColor];
    self.errorLabel = [UILabel new];
    
    [self.errorView addSubview:self.errorLabel];
    [self.errorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.and.centerY.equalTo(self.errorView);
        make.height.and.width.mas_equalTo(64);
    }];
}

- (void)showErrorViewWithErrorMessage:(NSString *)errorMessage {
    self.errorLabel.text = errorMessage;
    [self.view addSubview:self.errorView];
    [self.errorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.errorView.layer.zPosition = 999;
}

- (void)hideErrorView {
    [self.errorView removeFromSuperview];
}

- (void)showLoadingView {
    [self.view addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.indicatorView startAnimating];
    
    self.loadingView.layer.zPosition = 999;
}

- (void)hideLoadingView {
    [self.indicatorView stopAnimating];
    [self.loadingView removeFromSuperview];
}

- (void)generateLoadingView {
    self.loadingView = [UIView new];
    self.loadingView.backgroundColor = [UIColor grayColor];
    self.indicatorView = [UIActivityIndicatorView new];
    
    [self.loadingView addSubview:self.indicatorView];
    [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.and.centerY.equalTo(self.loadingView);
        make.height.and.width.mas_equalTo(64);
    }];
}



@end
